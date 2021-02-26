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

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
def main(jspellAPIKey, path):

    print(path)

    url = "https://jspell-checker.p.rapidapi.com/check"
    headers = {
        'content-type': "application/json",
        'x-rapidapi-key': jspellAPIKey,
        'x-rapidapi-host': "jspell-checker.p.rapidapi.com"
    }

    ## Iterates on all the project-pages
    pathlist = Path(path).glob('**/*-minify.markdown')
    for path in pathlist:
        # convert it because path is object not string
        pathContent = str(path)
        print(">>> Start " + pathContent)

        # Send the reaquest
        with open(pathContent, 'r') as content_file:
            text = content_file.read().strip('\\')
            #print(text)
            payload = "{\t\"language\": \"enUS\",\t\"fieldvalues\": \"" + text + "\",\t\"config\": {\t\t\"forceUpperCase\": false,\t\t\"ignoreIrregularCaps\": false,\t\t\"ignoreFirstCaps\": true,\t\t\"ignoreNumbers\": true,\t\t\"ignoreUpper\": false,\t\t\"ignoreDouble\": false,\t\t\"ignoreWordsWithNumbers\": true\t}}"
            print(payload)
            response = requests.request("POST", url, data=payload, headers=headers)
            print(response.text)
        #endwith
    #endfor
#enddef

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
#endif
