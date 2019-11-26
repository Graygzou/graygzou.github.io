# -*- coding: utf-8 -*-
#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

import sys                          # To get command line arguments
import os                           # for IO files
import re                           # Regular expression
import xml.etree.ElementTree as ET

LIGHTHOUSE_CONFIG_PATH = "../lighthouserc.json"
INDENTATION = "        "

def parse(isProduction, xmlPath):
    tree = ET.parse(xmlPath)
    root = tree.getroot()
    urls = "[" + '\n' + "        "
    for url in root.findall('{http://www.sitemaps.org/schemas/sitemap/0.9}url'):
        loc = url.find('{http://www.sitemaps.org/schemas/sitemap/0.9}loc').text

        if isProduction:
            loc = "http://localhost:4000/" + loc

        urls += "\"" + loc + "\", " + '\n' + INDENTATION
    urls = urls[:-3 - len(INDENTATION)] + "]" + '\n' + "    "
    return urls


def addUrls(urls):
    #for line in open(LIGHTHOUSE_CONFIG_PATH, 'w'):
    #    line = re.sub(r'url": *', '"url": ' + urls, line)

    # Read in the file
    with open(LIGHTHOUSE_CONFIG_PATH, 'r') as file :
        filedata = file.read()

    # Replace the target string
    print(filedata)
    filedata = re.sub(r'(\"urls\": )[^\}]*', '\\1' + urls, filedata)
    print(filedata)
    #filedata = filedata.replace('"url": ', '"url": ' + urls)

    # Write the file out again
    with open(LIGHTHOUSE_CONFIG_PATH, 'w') as file:
        file.write(filedata)

    # = open(pathReadFile,'r')
    #for line in originalContent:
    #    # Remove header comment
    #   line = re.sub(r'<!---*.*-*-->', '', line)

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
def main(isProduction, xmlPath):
    print("Gather all the website urls...")

    # Step 1
    urls = parse(isProduction, xmlPath)
    print(urls)

    # Step 2
    addUrls(urls)

    print("Added all the website urls.")
#enddef

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
#endif