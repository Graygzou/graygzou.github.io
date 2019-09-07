# -*- coding: utf-8 -*-
#
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#

import sys                          # To get command line arguments
import os                           # for IO files
import fileinput
from datetime import datetime
from ruamel.yaml import YAML        # for github languages
import requests                     # Useful to make curl request to github API
from pathlib import Path

# Static const variables
endOfFile = '\n'
FOLDER_PATH = "..\_project-pages\\"
page_layout = "project-page"
postFileName = ".markdown"

# -----------------------------------------------------
#                       createThumbnailImage
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

# ----------------------------------------------------------------------------------
#                       findLanguageColor
# ----------------------------------------------------------------------------------
def findLanguageColor(languageName, githubToken):
    url = "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Accept": "application/vnd.github.mercy-preview+json", "Authorization": "token " + githubToken}
    response = requests.get(url, headers=headers)
    yaml = YAML()
    data = yaml.load(response.text)
    color = "#000000"
    if languageName in data:
        color = data[languageName]['color'].strip()
    return color


# ----------------------------------------------------------------------------------
#                       generateRepoMdPage
# ----------------------------------------------------------------------------------
def generateRepoMdPage(file, currentRepository, username, githubToken):
    # Dictionnary that hold :
    #   - KEY = string used in the front matters.
    #   - VALUE = github API key.
    frontMatterToGithubDict = {
        "title": "name",
        "description": "description",
        "language": "language",
        "stargazers-count": "stargazers-count",
        "forks-count": "forks-count",
        "updated-at": "updated-at",
    }
    
    # Start Front Matters
    file.write("""---""" + endOfFile)
    file.write("""layout: """ + page_layout + endOfFile)
    for key in frontMatterToGithubDict:
        githubValue = currentRepository[frontMatterToGithubDict[key].replace('-', '_')]
        if key == "updated-at":
            # Add special field to know number of days it has been updated
            githubValue = datetime.strptime(githubValue, "%Y-%m-%dT%H:%M:%SZ")
            githubValue.strftime('%A %b %d, %Y at %H:%M GMT')
            lastUpdate = githubValue
        if key == "language":
            # Add the color in the same
            file.write("""color: """ + str(findLanguageColor(finalStr, githubToken)) + endOfFile)
        file.write(key + ": " + str(githubValue) + endOfFile)

    file.write("last-update-days: " + str((datetime.now() - lastUpdate).days) + endOfFile)
    file.write("tags: " + str(addRepositoryTopics(username, currentRepository, githubToken)) + endOfFile)
    file.write("""---""" + endOfFile)
    # End of the Front Matter

    # Write default template
    file.write("""<!---""" + endOfFile)
    file.write("""Gregoire Boiron <gregoire.boiron@gmail.com>""" + endOfFile)
    file.write("""Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.""" + endOfFile)
    file.write("""--->""" + endOfFile + endOfFile)
    
    file.write("""Overview""" + endOfFile)
    file.write("""--------------------""" + endOfFile)
    file.write("""In Progress.""" + endOfFile + endOfFile)

    file.write("""Screenshots""" + endOfFile)
    file.write("""--------------------""" + endOfFile)
    file.write("""In Progress.""" + endOfFile + endOfFile)

    file.write("""Detailed Info""" + endOfFile)
    file.write("""--------------------""" + endOfFile)
    file.write("""In Progress.""" + endOfFile + endOfFile)
    

# ----------------------------------------------------------------------------------
#                            updateRepoMdPage
# ----------------------------------------------------------------------------------
def updateRepoMdPage(filename, currentRepository, username, githubToken):
    fields = ["description", "language", "stargazers-count", "forks-count", "updated-at"]
    
    lastUpdate = ""
    started = False
    skip = False
    for line in fileinput.input(FOLDER_PATH + filename, inplace=1):
        if skip:
            print(line.rstrip())
        elif line.startswith('---'):
            if not started:
                started = True
            else:
                skip = True
            print(line.rstrip())
        else:
            if line.startswith("last-update-days"):
                print("last-update-days: " + str((datetime.now() - lastUpdate).days))
            elif line.startswith("title:"):
                print("title : " + currentRepository["name"])
            elif line.startswith("tags:"):
                array = addRepositoryTopics(username, currentRepository, githubToken)
                print("tags: " + str(array))
            else:
                assign = False
                for field in fields:
                    if line.startswith(field):
                        assign = True
                        finalStr = currentRepository[field.replace('-', '_')]
                        if field == "updated-at":
                            # Add special field to know number of days it has been updated
                            finalStr = datetime.strptime(finalStr, "%Y-%m-%dT%H:%M:%SZ")
                            finalStr.strftime('%A %b %d, %Y at %H:%M GMT')
                            lastUpdate = finalStr
                        if field == "language":
                            # Add the color in the same
                            print("color: " + str(findLanguageColor(finalStr, githubToken)))
                        print(field + ": " + str(finalStr))
                        break
                if not assign:
                    print(line.rstrip())

# ----------------------------------------------------------------------------------
#                            generateUserRepos
# ----------------------------------------------------------------------------------
def generateUserRepos(username, githubToken):
    url = "https://api.github.com/users/" + username + "/repos"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    jsonRepo = r.json()

    # Create the folder if it doesn't exist yet
    if not os.path.exists(FOLDER_PATH):
        os.makedirs(FOLDER_PATH)
    
    for currentRepository in jsonRepo:
        filename = currentRepository["name"] + postFileName
        
        #if currentRepository["name"] == "Metenorage" or currentRepository["name"] == "Brain-Control":
        print(currentRepository["name"])

        isPrivate = currentRepository["private"]
        hasGithubPages = currentRepository["has_pages"]
        if(not isPrivate and hasGithubPages):
                
            # Open the existing file or create it
            if os.path.isfile(FOLDER_PATH + filename):
                # Modify the font matters of the file since it already exists
                # (we do not want to override the content of the file !)
                print("Update in progress....")
                updateRepoMdPage(filename, currentRepository, username, githubToken)
            else:
                # Create the file from scratch and generate the front matters part
                file = open(FOLDER_PATH + filename,'w')
                generateRepoMdPage(file, currentRepository, username, githubToken)
                print("Generation in progress....")

# ----------------------------------------------------------------------------------
#                           addHtmlMainSection
# ----------------------------------------------------------------------------------
def addHtmlMainSection(githubToken):
    # Change those fields in order to customize the generation
    username = ['Graygzou', 'dyga-entertainment']

    for i in range(0, len(username)):
        print("Generate the current user " + username[i] + "...")
        generateUserRepos(username[i], githubToken)
        print("Finish generation for user " + username[i] + ".")


# ----------------------------------------------------------------------------------
#                           addHtmlBody
# ----------------------------------------------------------------------------------
def addJekyllFrontMatter(githubToken):
    addHtmlMainSection(githubToken)

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
if __name__ == "__main__":
    #githubToken = sys.argv[1]
    githubToken = "6b548620b813af56d067a9d264d21e463e9fa368"
    print("Launch static website generation...")

    print("Start the code gen...")
    addJekyllFrontMatter(githubToken)
    print("Code gen ended.")
