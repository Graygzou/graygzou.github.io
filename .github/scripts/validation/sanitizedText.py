# -*- coding: utf-8 -*-
#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2021 Grégoire Boiron  All Rights Reserved.
#############################################################################

import time
import sys                          # To get command line arguments
import os                           # for IO files
import re                           # Regular expression
import requests                     # Useful to make curl request to github API
from pathlib import Path

# Static const variables
endOfFile = '\n'
PROJECT_TXT_CONTENT_FOLDER = "projects-content-sanitized"
RELATIVE_PATH = "../../jekyll/_includes/"

# ----------------------------------------------------------------------------------
#                    convertMdToPlainText
# convertMdToPlainText function
# Arguments :
# ----------------------------------------------------------------------------------
def convertMdToPlainText(pathReadFile, pathWriteFile):
    file = open(pathWriteFile,'w')

    finalStr=""

    originalContent = open(pathReadFile,'r')
    for line in originalContent:
        # Remove header comment
        line = re.sub(r'<!---*.*-*-->', '', line)
        # Remove any links
        line = re.sub(r'\[(.*)\]\(.*\)', '\\1', line)
        # Remove any emojis (like :crin:)
        line = re.sub(r'\:.*\: *', '', line)

        # Remove html tags
        # Should not be used and replaced by md instead...
        line = re.sub(r'\<.*\>(.*)\<.*\>', '\\1', line)
        
        # Remove header lines
        line = re.sub(r'-*', '', line)
        line = re.sub(r'#+ *', '', line)
        # Remove miscellaneous like code
        line = re.sub(r'`([^`]*)`', '\\1', line)
        line = re.sub(r'`{3}([^`]*)`{3}', '', line)
        
        # Remove front matters (for blog post later on)
        line = re.sub(r'-{3}(\n|.*:.*)*-{3}', '', line)

        # Remove liquid tags
        line = re.sub(r'\{\%.*\%\}', '', line)

        # Remove all \n for curl request
        mergedLine = re.sub(r'\n', ' ', line)
        
        if line.startswith('|'):
            # This is an array: Replace all pipe by \n except the first one
            #file.write(line.replace('|', '\n').replace('-', '').replace(':.*:', ''))
            line = re.sub(r'\|:?-* *([^| :]*):?', '\\1\n', line)
            for word in line.split('\n'):
                wordStripped = word.strip()
                if wordStripped:
                    finalStr += wordStripped + ' '
                    file.write(wordStripped + '\n')
        else:
            finalStr += mergedLine
            file.write(line)

    file.close()

    return finalStr

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
def main():

    ## Create the folder "sanitized-txt" if it doesn't exist yet
    if not os.path.exists(RELATIVE_PATH + PROJECT_TXT_CONTENT_FOLDER):
        os.makedirs(RELATIVE_PATH + PROJECT_TXT_CONTENT_FOLDER)

    ## Iterates on all the project-pages
    pathlist = Path(RELATIVE_PATH + "projects-content/").glob('**/*.markdown')
    print(str(pathlist))

    for path in pathlist:
        # because path is object not string
        pathContent = str(path)
        print(">>> Start " + pathContent)

        pathTxt = RELATIVE_PATH + PROJECT_TXT_CONTENT_FOLDER + '/' + str(path.stem) + "-txt" + str(path.suffix)

        # Post-process step to avoid having markdown flagged as errors during grammar checks
        content = convertMdToPlainText(pathContent, pathTxt)

        print(content)

#enddef

if __name__ == "__main__":
    main()
#endif
