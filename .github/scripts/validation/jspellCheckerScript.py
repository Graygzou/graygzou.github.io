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
BASIC_REL_PATH2 = "../jekyll/_includes/"
BLOG_FOLDER_REL_PATH = "blog/"

# ----------------------------------------------------------------------------------
#                    checkGrammarBot
# checkGrammarBot function
# Arguments :
# ----------------------------------------------------------------------------------
def checkGrammarBot(grammarBotAPIKey, filePathName, text, file):
    # Creating the client
    #client = GrammarBotClient()
    client = GrammarBotClient(api_key=grammarBotAPIKey)

    # Analyzing the text
    # check the text, returns GrammarBotApiResponse object
    res = client.check(text)

    # Inspecting the GrammarBotApiResponse object
    # check detected language (Example: "en-US")
    file.write("Detected language: " + res.detected_language + '\n')

    # see the suggestions / corrections suggested by the GrammarBot API
    # returns a list of GrammarBotMatch objects describing each replacement
    #print(res.matches)

    if res.result_is_incomplete:
        file.write("GrammarBot result is incomplete. Exit the program." + '\n')
        quit

    # Inspecting the GrammarBotMatch object
    # =====================================

    file.write("Results for " + filePathName + ":" + '\n')
    file.write("==================================================================================\n")

    categories = {}
    for i in range(0, len(res.matches)):
        # Get the next error
        match = res.matches[i] # Example: GrammarBotMatch(offset=2, length=4, rule={'CANT'}, category={'TYPOS'})
        word = text[match.replacement_offset:match.replacement_offset+match.replacement_length]
        currentMatch = "            Word: {'" + str(word) + "'}, Index Offset: {'" + str(match.replacement_offset) + "'}, Possible Replacements: " + str(match.replacements) + '\n'
        
        # Keys are a concatenation of the category and the rule
        currentKey = str(match.category) + '-' + str(match.rule)
        if currentKey not in categories:
            #temp = {str(currentKey), str(currentMatch)}
            #categories.update(temp)
            categories[currentKey] = currentMatch
        else:
            categories[currentKey] += currentMatch

        ## Debug
        #for key in categories:
        #   print(    "key:{'" + key + "'} Value = { "+ categories[key]+" }\n")

        # get list of possible correct sentences after applying the replacements
        #match0.corrections # ["I can't remember how to go their", 'I cannot remember how to go their']

        # getting a friendly message regarding the replacement suggestion
        #match0.message # 'Did you mean "can\'t" or "cannot"?'

        # Getting even more information
        # =============================

        # if the information provided by the class properties is not enough, you can
        # always access the complete original JSON response from GrammarBotApiResponse
        # object
        #res.raw_json

    lastCategory = ''
    lastRule = ''
    for key in sorted(categories):
        categoryNrule = key.split('-')
        if categoryNrule[0] != lastCategory:
            lastCategory = categoryNrule[0]
            file.write("    Category:{'" + lastCategory + "'}\n")
        if categoryNrule[1] != lastRule:
            lastRule = categoryNrule[1]
            file.write("        Rule:{'" + lastRule + "'}\n")
        file.write(categories[key])
        i = i + 1

    file.write('\n')

# ----------------------------------------------------------------------------------
#                    convertMdToPlainText
# convertMdToPlainText function
# Arguments :
# ----------------------------------------------------------------------------------
def convertMdToPlainText(pathReadFile, pathWriteFile):
    file = open(pathWriteFile,'w')

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
        line = re.sub(r'\<.*\>(.*)\<.*\> *', '\\1', line)
        
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
        
        if line.startswith('|'):
            # This is an array: Replace all pipe by \n except the first one
            #file.write(line.replace('|', '\n').replace('-', '').replace(':.*:', ''))
            line = re.sub(r'\|:?-* *([^| :]*):?', '\\1\n', line)
            for word in line.split('\n'):
                wordStripped = word.strip()
                if wordStripped:
                    file.write(wordStripped + '\n')
        else:
            file.write(line)

    file.close()

# ----------------------------------------------------------------------------------
#                    applyAfterTheDeadlineCheck
# applyAfterTheDeadlineCheck function
# Arguments : (Folder Path)
# ----------------------------------------------------------------------------------
def applyGrammarBotCheck(grammarBotAPIKey, folderPath):
    ## Create the folder "sanitized-txt" if it doesn't exist yet
    if not os.path.exists(folderPath + PROJECT_TXT_CONTENT_FOLDER):
        os.makedirs(folderPath + PROJECT_TXT_CONTENT_FOLDER)

    resultsFile = open("grammarBotResults.txt", 'w')
    
    ## Iterates on all the project-pages
    pathlist = Path(folderPath + "projects-content/").glob('**/*.markdown')
    for path in pathlist:
        # because path is object not string
        pathContent = str(path)
        print(">>> Start " + pathContent)

        pathTxt = folderPath + PROJECT_TXT_CONTENT_FOLDER + '/' + str(path.stem) + "-txt" + str(path.suffix)

        # Post-process step to avoid having markdown flagged as errors.
        convertMdToPlainText(pathContent, pathTxt)

        # Start the grammar checking
        with open(pathTxt, 'r') as content_file:
            #print(content_file.read().strip())
            checkGrammarBot(grammarBotAPIKey, str(path), content_file.read().strip(), resultsFile)

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
def main(jspellAPIKey):

    url = "https://jspell-checker.p.rapidapi.com/check"

    payload = "{
        \t\"language\": \"enUS\",
        \t\"fieldvalues\": \"thiss is intresting\",
        \t\"config\": {
        \t\t\"forceUpperCase\": false,
        \t\t\"ignoreIrregularCaps\": false,
        \t\t\"ignoreFirstCaps\": true,
        \t\t\"ignoreNumbers\": true,
        \t\t\"ignoreUpper\": false,
        \t\t\"ignoreDouble\": false,
        \t\t\"ignoreWordsWithNumbers\": true
        \t}
        }"
    
    headers = {
        'content-type': "application/json",
        'x-rapidapi-key': jspellAPIKey,
        'x-rapidapi-host': "jspell-checker.p.rapidapi.com"
        }

    response = requests.request("POST", url, data=payload, headers=headers)

    print(response.text)
#enddef

if __name__ == "__main__":
    main(sys.argv[1])
#endif
