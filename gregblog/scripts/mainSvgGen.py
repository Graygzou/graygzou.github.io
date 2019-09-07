#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
#
# Create main svg files that contains all images that belong to a category
#############################################################################

import os
from xml.dom import minidom

DIRECTORY_PATH = "../assets/icons/"
FILE_PREFIX = "gamefolio-"
FILE_POSTFIX = "-icons.svg"

SVG_SCALE = "0.67";

ESCAPE = '\n'

####################################################################
#
# addSvgFile : Add one svg image to the current file descriptor
#
####################################################################
def addSvgFile( file, svgPath, filename ):
    doc = minidom.parse(svgPath)
    transform_strings = [path.getAttribute('transform') for path in doc.getElementsByTagName('path')]
    path_strings = [path.getAttribute('d') for path in doc.getElementsByTagName('path')]

    # Start writing the corresponding image in the doc
    file.write("""<symbol id=\"""" + filename + """\" fill-rule="evenodd" clip-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="1.414">""" + ESCAPE)

    # Apply the standard scale or the specified one.
    currentScale = "scale(" + SVG_SCALE + ")"
    if len(transform_strings) > 0 and transform_strings[0] != "" :
        currentScale = transform_strings[0]
        
    file.write("""  <path transform=\"""" + currentScale + """\" d=\"""" + path_strings[0] + """\" />""" + ESCAPE)
    file.write("""</symbol>""" + ESCAPE)
    file.write(ESCAPE)
    
    doc.unlink()
    return



####################################################################
#
# Main
#
####################################################################
# For each folder
for dirfilename in os.listdir(DIRECTORY_PATH):
    currentPath = os.path.join(DIRECTORY_PATH, dirfilename)
    if os.path.isdir(currentPath):

        # Create the global svg file that will hold all the directory svg images
        currentFileName = DIRECTORY_PATH + FILE_PREFIX + dirfilename + FILE_POSTFIX
        print(currentFileName)
        file = open(currentFileName, "w")

        # Write the header of the doc
        file.write("""<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">""" + ESCAPE)
        file.write(ESCAPE)
        
        print(currentPath)
        for filename in os.listdir(currentPath):
            filePath = os.path.join(currentPath, filename)
            print(filePath)
            addSvgFile(file, filePath, os.path.splitext(filename)[0])

        file.write("""</svg>""" + ESCAPE)


