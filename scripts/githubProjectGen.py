# -*- coding: utf-8 -*-
#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
#############################################################################

import sys                          # To get command line arguments
import os                           # for IO files
import fileinput
import re                           # Regular expression
from datetime import datetime
from ruamel.yaml import YAML        # for github languages
import requests                     # Useful to make curl request to github API
from pathlib import Path

# Static const variables
endOfFile = '\n'
FOLDER_REL_PATH = "..\\jekyll\\_project-pages\\"
ADDIT_FM_FOLDER_REL_PATH = "..\\jekyll\\_includes\\projects-front-matter\\"
PAGE_LAYOUT = "project-page"
postFileName = ".markdown"
DEFAULT_REPO_COLOR = "#000000"
ALL_FIELDS = ["title", "description", "color", "language", "stargazers-count", "forks-count", "last-update-days", "updated-at", "tags"]

# -----------------------------------------------------
#                       createThumbnailImage
# ...WIP...
# -----------------------------------------------------
def createThumbnailImage(file, username, jsonRepo, isHighlighted, githubToken):
    htmlIdUsed = "minipicgame"
    if isHighlighted:
        htmlIdUsed = "gifgame"
        url = "https://api.github.com/repos/" + username + "/" + jsonRepo["name"] + "/contents/logo.png"
    else:
        htmlIdUsed = "minipicgame"
        url = "https://api.github.com/repos/" + username + "/" + jsonRepo["name"] + "/contents/logo.png"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    imageResponse = r.json()
    if imageResponse.get('message') == None:
        file.write("""              <img src=""" + imageResponse["download_url"] + """ class=\"""" + htmlIdUsed + """\">""")
    else:
        file.write("""              <i class="far fa-question-circle """ + htmlIdUsed + """\"></i>""")

# ----------------------------------------------------------------------------------
#                       addRepositoryTopics
#
# Request and Create all the GitHub topics (repository tags)
# <!> Warning : This use a preview request meaning it might change in the feature
# ----------------------------------------------------------------------------------
def addRepositoryTopics(username, jsonRepo, githubToken):
    htmlIdUsed = "gifgame"
    url = "https://api.github.com/repos/" + username + "/" + jsonRepo["name"] + "/topics"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Accept": "application/vnd.github.mercy-preview+json", "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    topicsResponse = r.json()
    return topicsResponse['names']
#enddef

# ----------------------------------------------------------------------------------
#                       findLanguageColor
# ----------------------------------------------------------------------------------
def findLanguageColor(languageName, githubToken):
    url = "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Accept": "application/vnd.github.mercy-preview+json", "Authorization": "token " + githubToken}
    response = requests.get(url, headers=headers)
    yaml = YAML()
    data = yaml.load(response.text)
    color = DEFAULT_REPO_COLOR
    if languageName in data:
        color = data[languageName]['color'].strip()
    #endif
    return "\"" + color + "\""
#enddef

# ----------------------------------------------------------------------------------
#                       generateFrontMatter
#
# Write front matter (header)
# ----------------------------------------------------------------------------------
def generateFrontMatter(currentRepository, username, githubToken):
    ## Dictionnary that hold :
    ##   - KEY = string used in the front matters.
    ##   - VALUE = github API key.
    frontMatterToGithubDict = {
        "title": "name",
        "description": "description",
        "language": "language",
        "stargazers-count": "stargazers-count",
        "forks-count": "forks-count",
        "updated-at": "pushed_at",
    }
    finalStr = ""
    lastUpdate = datetime.now()
    
    finalStr += "layout: " + PAGE_LAYOUT + endOfFile
    for key in frontMatterToGithubDict:
        githubValue = currentRepository[frontMatterToGithubDict[key].replace('-', '_')]
        if key == "updated-at":
            ## Add special field to know number of days it has been updated
            githubValue = datetime.strptime(githubValue, "%Y-%m-%dT%H:%M:%SZ")
            githubValue.strftime('%A %b %d, %Y at %H:%M GMT')
            lastUpdate = githubValue
        elif key == "language":
            ## Add the color in the same
            finalStr += "color: " + str(findLanguageColor(githubValue, githubToken)) + endOfFile
        #endif
        finalStr += key + ": " + str(githubValue) + endOfFile
    #endfor
    finalStr += "last-update-days: " + str((datetime.now() - lastUpdate).days) + endOfFile
    finalStr += "tags: " + str(addRepositoryTopics(username, currentRepository, githubToken))
    return finalStr
#enddef

# ----------------------------------------------------------------------------------
#                       addAdditionalFrontMatter
#
# Copy the additional front matter to the final merged file.
# ----------------------------------------------------------------------------------
def addAdditionalFrontMatter(file, currentRepository):
    print(ADDIT_FM_FOLDER_REL_PATH + currentRepository["name"] + "-fm.yml")
    
    filePath = ADDIT_FM_FOLDER_REL_PATH + currentRepository["name"] + "-fm.yml"
    additionalFile = open(filePath,'r')
    for line in additionalFile:
        file.write(line)

#enddef

# ----------------------------------------------------------------------------------
#                       printContentTemplate
#
# Write default template
# ----------------------------------------------------------------------------------
def printContentTemplate(file, currentRepository):
    file.write("""<!---""" + endOfFile)
    file.write("""Gregoire Boiron <gregoire.boiron@gmail.com>""" + endOfFile)
    file.write("""Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.""" + endOfFile)
    file.write("""--->""" + endOfFile + endOfFile)
    
    file.write("""{% capture my_include %}""" + endOfFile)
    file.write("""{% include projects-content/""" + currentRepository["name"] + """-content.markdown %}""" + endOfFile)
    file.write("""{% endcapture %}""" + endOfFile)
    file.write("""{{ my_include | markdownify }}""" + endOfFile)
#enddef

# ----------------------------------------------------------------------------------
#                       generateRepoMdPage
# ----------------------------------------------------------------------------------
def generateRepoMdPage(file, currentRepository, username, githubToken):
    file.write("---" + endOfFile)
    file.write(generateFrontMatter(currentRepository, username, githubToken) + endOfFile)
    addAdditionalFrontMatter(file, currentRepository)
    file.write("---" + endOfFile)
    printContentTemplate(file, currentRepository)
#enddef
    

# ----------------------------------------------------------------------------------
#                       updateFrontMattersAtLine
# ----------------------------------------------------------------------------------
def updateFrontMattersAtLine(line, currentRepository, username, githubToken):
    finalLineStr = ""
    
    regular_fields = ["description", "language", "stargazers-count", "forks-count", "updated-at"]
    computed_fields = ["title", "tags", "color", "last-update-days"]
    lastUpdate = datetime.now()
    has_changed = False  ## Allow to print the end if no change has been made
    field_met = ""
    
    ## Check if we should add 
    for field in computed_fields:
        if line.startswith(field):
            ## Update variables
            has_changed = True
            field_met = field
            
            if field == computed_fields[0]:
                finalLineStr += field + ": " + str(currentRepository["name"]) + endOfFile
            elif field == computed_fields[1]:
                array = addRepositoryTopics(username, currentRepository, githubToken)
                finalLineStr += field + ": " + str(array) + endOfFile
            else:
                pass # Nothing. This will erase the current line from the doc
            #endif
        #endif
    #endfor

    if not has_changed:
        for field in regular_fields:
            if line.startswith(field):
                ##Update variables
                has_changed = True
                field_met = field
                
                ## Retrieve the new value to update the field
                finalStr = currentRepository[field.replace('-', '_')]

                ## Add special field to know number of days it has been updated
                if field == "updated-at":
                    finalStr = datetime.strptime(finalStr, "%Y-%m-%dT%H:%M:%SZ")
                    finalStr.strftime('%A %b %d, %Y at %H:%M GMT')
                    lastUpdate = finalStr
                #endif

                ## Update the current field with the new value
                finalLineStr += field + ": " + str(finalStr) + endOfFile
              
                ## Add the color if the language is 
                if field == "language":
                    finalLineStr += "color: " + str(findLanguageColor(finalStr, githubToken)) + endOfFile
                elif field == "updated-at":
                    finalLineStr += "last-update-days: " + str((datetime.now() - lastUpdate).days) + endOfFile
                #endif

                break # break the loop because we already match a field on that line
                ## Print the line is nothing has been made yet
            #endif
        #endfor
        if not has_changed:
            finalLineStr += line
        #endif
    #endif

    ## Generate the missing field
    return finalLineStr, field_met
#enddef


#def generateMissingVariables(updated_fields):

    #ALL_FIELDS

#enddef

# ----------------------------------------------------------------------------------
#                            updateRepoMdPage
#
# Update the front matters of the project jekyll post (in markdown)
# ----------------------------------------------------------------------------------
def updateRepoMdPage(filename, currentRepository, username, githubToken):
    frontMattersStr = ""
    started = skip = False
    updated_fields = [] ## Will track which fields has been meet
    
    for line in fileinput.input(FOLDER_REL_PATH + filename, inplace=1):
        if skip:
            ## to skip the rest of the document
            print(line.rstrip())
        elif line.startswith('---'):
            ## Special behavior when we detect starting/ending of front matters 
            if not started:
                started = True
            else:
                #frontMattersStr += generateMissingVariables(updated_fields)
                #print(frontMattersStr)

                # Generate a brand new front matter from scratch
                print(generateFrontMatter(currentRepository, username, githubToken))
                
                skip = True
            #endif
            print(line.rstrip())
        else:
            ## Nuke all the previous front matter by doing nothing
            pass
            
            ## Update the front matters
            #currentStr, fieldMet = updateFrontMattersAtLine(line, currentRepository, username, githubToken)
            #frontMattersStr += currentStr
            #updated_fields.append(fieldMet)
        #endif
    #endfor
#enddef

# ----------------------------------------------------------------------------------
#                            generateUserRepos
# ----------------------------------------------------------------------------------
def generateUserRepos(username, githubToken):
    url = "https://api.github.com/users/" + username + "/repos"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    jsonRepo = r.json()

    ## Create the folder if it doesn't exist yet
    if not os.path.exists(FOLDER_REL_PATH):
        os.makedirs(FOLDER_REL_PATH)

    # Safe check to see if the token is valid
    if len(jsonRepo) <= 1:
        print("The token used might be out-dated or revoked. Please check this before going any further.")
        return 0
    else:
        for currentRepository in jsonRepo:
            filename = currentRepository["name"] + postFileName
            isPrivate = currentRepository["private"]
            hasGithubPages = currentRepository["has_pages"]

            if(not isPrivate and hasGithubPages):
                ## Open the existing file or create it
                #if os.path.isfile(FOLDER_REL_PATH + filename) and os.stat(FOLDER_REL_PATH + filename).st_size != 0:
                #    ## Modify the font matters of the file since it already exists
                #    ## (we do not want to override the content of the file !)
                #    print(" >>> Update of " + currentRepository["name"] + " in progress....")
                #    updateRepoMdPage(filename, currentRepository, username, githubToken)
                #    print("Update ended !")
                #else:
                ## Create the file from scratch and generate the front matters part
                file = open(FOLDER_REL_PATH + filename,'w')
                print(" >>> Generation of " + currentRepository["name"] + " in progress...")
                generateRepoMdPage(file, currentRepository, username, githubToken)
                print(" >>> Generation ended !")
                file.close()
                #endif
            #endif
        #endfor
    #endif
#enddef

# ----------------------------------------------------------------------------------
#                           updateProjectPages
# ----------------------------------------------------------------------------------
def updateProjectPages(githubToken):
    ## Change those fields in order to customize the generation
    username = ['Graygzou', 'dyga-entertainment']

    for i in range(0, len(username)):
        print("================================================")
        print("Generate the current user " + username[i] + "...")
        generateUserRepos(username[i], githubToken)
        print("Finish generation for user " + username[i] + ".")
    #endfor
#enddef

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
if __name__ == "__main__":
    githubToken = sys.argv[1]
    print("Launch static website generation...")

    print("Start the code gen...")
    updateProjectPages(githubToken)
    print("Code gen ended.")
#endif
