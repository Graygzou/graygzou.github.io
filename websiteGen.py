# -*- coding: utf-8 -*-
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018 Grégoire Boiron  All Rights Reserved.
#
# Note :
# This file should maybe be created by reading an html file..
# Will see later on.

import sys                          # To get command line arguments
import os                           # for IO files
from ruamel.yaml import YAML        # for github languages
import requests                     # Useful to make curl request to github API
from pathlib import Path

# Static const variables
endOfFile = '\n'

# -----------------------------------------------------
#                        addHtmlHeader
# -----------------------------------------------------
def addHtmlHeader(file):
    file.write("""<head>""" + endOfFile)
    file.write("""  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />""" + endOfFile)
    file.write("""  <!-- Basic Page Needs -->""" + endOfFile)
    file.write("""  <title>Grégoire Boiron</title>""" + endOfFile)
    file.write("""  <!-- FONT -->""" + endOfFile)
    file.write("""  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400i,700,700i" rel="stylesheet">""" + endOfFile)
    file.write("""  <!-- CSS -->""" + endOfFile)
    file.write("""  <link rel="stylesheet" href="resources/css/style.css">""" + endOfFile)
    file.write("""  <!-- Favicon -->""" + endOfFile)
    file.write("""  <link rel="icon" type="image/png" href="resources/image/chat.ico">""" + endOfFile)
    file.write("""</head>""" + endOfFile)

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
def addRepositoryTopics(file, username, jsonRepo, githubToken):
    htmlIdUsed = "gifgame"
    url = "https://api.github.com/repos/" + username + "/" + jsonRepo["name"] + "/topics"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Accept": "application/vnd.github.mercy-preview+json", "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    topicsResponse = r.json()
    file.write("""                <div class=tagsgame>""" + endOfFile)
    for currentTag in topicsResponse['names']:
        file.write("""                  <span class="tag">""" + currentTag + """</span>""" + endOfFile)
    file.write("""                </div>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                       addContributors
# ----------------------------------------------------------------------------------
def addContributors(file, username, jsonRepo, githubToken):
    url = "https://api.github.com/repos/" + username + "/" + jsonRepo["name"] + "/contributors"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', 'Authorization': 'token ' + githubToken}
    response = requests.get(url, headers=headers)
    contributorsJson = response.json()
    for currentContributor in contributorsJson:
        file.write("""                  <img src=\"""" + currentContributor["avatar_url"] + """\" class="contributorIcon" >""" + endOfFile)

# ----------------------------------------------------------------------------------
#                       findLanguageColor
# ----------------------------------------------------------------------------------
def findLanguageColor(colorName, githubToken):
    url = "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Accept": "application/vnd.github.mercy-preview+json", "Authorization": "token " + githubToken}
    response = requests.get(url, headers=headers)
    yaml = YAML()
    data = yaml.load(response.text)
    return "color:" + data[colorName]['color'].strip() + ";"

# ----------------------------------------------------------------------------------
#                       addRepositoryFooters
# ----------------------------------------------------------------------------------
def addRepositoryFooter(file, username, jsonRepo, githubToken):
    file.write("""            <footer>""" + endOfFile)
    file.write("""              <div class="repositoryFooter">""" + endOfFile)
    file.write("""                <div>""" + endOfFile)
    if jsonRepo.get('language') != None:
        file.write("""                  <i class="fas fa-circle" style=\"""" + findLanguageColor(jsonRepo['language'], githubToken) + """\"></i> """ + jsonRepo['language'] + endOfFile)
    else:
        file.write("""                  <i class="fas fa-circle" style="color: black;"></i> Undefined""" + endOfFile)
    file.write("""                </div>""" + endOfFile)
    file.write("""                <div>""" + endOfFile)
    file.write("""                  <i class="fas fa-star"></i> """ + str(jsonRepo['stargazers_count']) + endOfFile)
    file.write("""                </div>""" + endOfFile)
    file.write("""                <div>""" + endOfFile)
    file.write("""                  <i class="fas fa-code-branch"></i> """ + str(jsonRepo['forks_count']) + endOfFile)
    file.write("""                </div>""" + endOfFile)
    file.write("""                <div>""" + endOfFile)
    file.write("""                  Built by""")
    addContributors(file, username, jsonRepo, githubToken)
    file.write("""                </div>""" + endOfFile)
    file.write("""           </div>""" + endOfFile)
    file.write("""        </footer>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                           addRepository
# Display all the info of the current repository
# ----------------------------------------------------------------------------------
def addRepository(file, username, jsonRepo, isHighlighted, githubToken):
    print("    Generate repository " + jsonRepo["name"] + "...")
    file.write("""        <article class="game">""" + endOfFile)
    file.write("""          <a href=\"""" + "https://" + username + ".github.io/" + jsonRepo["name"] + "/" + """\">""" + endOfFiles)
    createThumbnailImage(file, username, jsonRepo, isHighlighted, githubToken);
    file.write("""          </a>""")
    file.write("""          <div class="textgame">""" + endOfFile)
    file.write("""            <div class=repoHeader>""" + endOfFile)
    if isHighlighted:
        file.write("""              <h2 class="titlegame">""" + endOfFile)
    else:
        file.write("""              <h2 class="minititlegame">""" + endOfFile)
    file.write("""                <a href=\"""" + jsonRepo["homepage"] + """\">""" + jsonRepo["name"] + """</a>""" + endOfFile)
    file.write("""                <img alt="Website" src="https://img.shields.io/website/https/github.com/""" + username + """/""" + jsonRepo["name"] + """.svg\">""" + endOfFile)
    file.write("""              </h2>""" + endOfFile)
    file.write("""              <div class="floatSide">""" + endOfFile)
    file.write("""                <a href="https://github.com/""" + username + """/""" + jsonRepo["name"] + """\"><i class="fab fa-github fa-2x"></i></a>""" + endOfFile)
    file.write("""              </div>""" + endOfFile)
    file.write("""            </div>""" + endOfFile)
    file.write("""            <div class="infogame">""" + endOfFile)
    file.write("""              <div>""")
    file.write("""                <div id="minidescgame">""")
    file.write("""                  """ + (jsonRepo["description"] if bool(jsonRepo["description"].strip()) else "---") + endOfFile)
    file.write("""                </div>""" + endOfFile)
    addRepositoryTopics(file, username, jsonRepo, githubToken)
    file.write("""              </div>""" + endOfFile)
    file.write("""            </div>""" + endOfFile)
    addRepositoryFooter(file, username, jsonRepo, githubToken)
    file.write("""          </div>""" + endOfFile)
    file.write("""        </article>""" + endOfFile)
    print("    Finished repository " + jsonRepo["name"] + " generation.")

# ----------------------------------------------------------------------------------
#                           containHighlightTag
# Find the highlight tag (shield.io tag) in the README
#       True if it does contains it, false otherwise
# ----------------------------------------------------------------------------------
def containHighlightTag(currentRepository, username, githubToken):
    isHighlighted = False
    tagPattern = "Contributors"

    # Check if this repository should be highlighted or not
    url = "https://raw.githubusercontent.com/" + username + "/" + currentRepository["name"] + "/master/README.md"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Authorization": "token " + githubToken}
    reponse = requests.get(url, headers=headers)
    if not reponse == None:
        isHighlighted = reponse.text.find(tagPattern) != -1

    return isHighlighted

# ----------------------------------------------------------------------------------
#                            addRepositorySection
# ----------------------------------------------------------------------------------
def addRepositorySection(file, username, githubToken):
    url = "https://api.github.com/users/" + username + "/repos"
    headers = {'content-type': 'application/json', 'Accept-Charset': 'UTF-8', "Authorization": "token " + githubToken}
    r = requests.get(url, headers=headers)
    jsonRepo = r.json()
    for currentRepository in jsonRepo:
        isPrivate = currentRepository["private"]
        hasGithubPages = currentRepository["has_pages"]
        if(not isPrivate and hasGithubPages):
            # Check which layout we should apply
            isHighlighted = containHighlightTag(currentRepository, username, githubToken)
            if not isHighlighted:
                file.write("""      <div id="minimainleft">""" + endOfFile)
            addRepository(file, username, currentRepository, isHighlighted, githubToken)
            if not isHighlighted:
                file.write("""      </div>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                           addHtmlMainSection
# ----------------------------------------------------------------------------------
def addHtmlMainSection(file, githubToken):
    # Change those fields in order to customize the generation
    username = ['Graygzou', 'dyga-entertainment']

    file.write("""    <div id="main">""" + endOfFile)
    file.write("""      <p id="intro">""" + endOfFile)
    file.write("""        Hi ! Check out the projects I made ! Most of them are available on GitHub.""" + endOfFile)
    file.write("""      </p>""" + endOfFile)
    for i in range(0, len(username)):
        print("Generate the current user " + username[i] + "...")
        addRepositorySection(file, username[i], githubToken)
        print("Finish generation for user " + username[i] + ".")
    file.write("""      <p id="intro">""" + endOfFile)
    file.write("""          “Jack of all trades, master of none.”""" + endOfFile)
    file.write("""      </p>""" + endOfFile)
    file.write("""    </div>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                           addHtmlTopNav
# ----------------------------------------------------------------------------------
def addHtmlTopNav(file):
    # create the array for each
    icons = ["fas fa-user-circle", "fas fa-code", "fas fa-calendar-alt", "fab fa-github", "fab fa-linkedin-in", "fas fa-bolt"];
    links = ["", "", "", "https://github.com/Graygzou", "https://www.linkedin.com/in/gregoire-boiron/", "https://gamejolt.com/@GrayGzou"]
    description = ["About", "Skills", "Timeline", "Github", "Linkedin", "GameJolt"]

    file.write("""  <h1> Grégoire Boiron Portfolio </h1>""" + endOfFile)
    file.write("""  <h1> /!\  still under construction  /!\ </h1>""" + endOfFile)
    file.write("""  <nav id="top">""" + endOfFile)
    for i in range(0, len(icons)):
        file.write("""      <div class="link">""" + endOfFile)
        file.write("""        <a href=""" + links[i] + """>""" + endOfFile)
        file.write("""          <span class="iconlink">""" + endOfFile)
        file.write("""            <i class=" """ + icons[i] + """ fa-2x"></i>""" + endOfFile)
        file.write("""          </span>""" + endOfFile);
        file.write("""          <div class="textlink">""" + endOfFile);
        file.write("""            """ + description[i]);
        file.write("""          </div>""" + endOfFile);
        file.write("""        </a>""" + endOfFile);
        file.write("""      </div>""" + endOfFile);
    file.write("""  </nav>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                           addHtmlBody
# ----------------------------------------------------------------------------------
def addHtmlBody(file, githubToken):
    file.write("""<body>""" + endOfFile)

    addHtmlTopNav(file)
    addHtmlMainSection(file, githubToken)

# ----------------------------------------------------------------------------------
# no footer yet..
# ----------------------------------------------------------------------------------
#def addHtmlFooter(file):
#    file.write("Why? Because we can.\n")

# ----------------------------------------------------------------------------------
#                           addJavascript
# This should be decomposed on another function specially the onPlayerReady function
# ----------------------------------------------------------------------------------
def addJavascript(file):
    file.write("""<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
""")
    file.write("""<script>""" + endOfFile)
    file.write("""// Inject YouTube API script""" + endOfFile)
    file.write("""var tag = document.createElement('script');""" + endOfFile)
    file.write("""tag.src = "https://www.youtube.com/iframe_api";""" + endOfFile)
    file.write("""var firstScriptTag = document.getElementsByTagName('script')[0];""" + endOfFile)
    file.write("""firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);""" + endOfFile)
    file.write("""var player;""" + endOfFile)
    file.write("""function onYouTubePlayerAPIReady() {""" + endOfFile)
    file.write("""  // create the global player from the specific iframe (#video)""" + endOfFile)
    file.write("""  player = new YT.Player('video', {""" + endOfFile)
    file.write("""    events: {""" + endOfFile)
    file.write("""      // call this function when player is ready to use""" + endOfFile)
    file.write("""      'onReady': onPlayerReady""" + endOfFile)
    file.write("""    }""" + endOfFile)
    file.write("""  });""" + endOfFile)
    file.write("""} \n""" + endOfFile)
    file.write("""// Get the modal""")
    file.write("""var modal = document.getElementById('myModal');""" + endOfFile)
    file.write("""// Get the <span> element that closes the modal""" + endOfFile)
    file.write("""var span = document.getElementById("close");""" + endOfFile)
    file.write("""function onPlayerReady(event) {""" + endOfFile)
    file.write("""  // bind events""" + endOfFile)
    file.write("""  var playButtonPenguin = document.getElementById("playButtonPenguin");""" + endOfFile)
    file.write("""  playButtonPenguin.addEventListener("click", function() {""" + endOfFile)
    file.write("""    modal.style.display = "block";""" + endOfFile)
    file.write("""    player.playVideo();""" + endOfFile)
    file.write("""    player.loadVideoByUrl('https://www.youtube.com/v/wHgwNyjVPJM?version=3',0,'large');""" + endOfFile)
    file.write("""  });""" + endOfFile)
    file.write("""  var playButtonMetenorage = document.getElementById("playButtonMetenorage");""" + endOfFile)
    file.write("""  playButtonMetenorage.addEventListener("click", function() {""" + endOfFile)
    file.write("""    modal.style.display = "block";""" + endOfFile)
    file.write("""    player.playVideo();""" + endOfFile)
    file.write("""    player.loadVideoByUrl('https://www.youtube.com/v/ORAGPZGMJg4?version=3',0,'large');""" + endOfFile)
    file.write("""  });""")
    file.write("""  var playButtonRaven = document.getElementById("playButtonRaven");""" + endOfFile)
    file.write("""  playButtonRaven.addEventListener("click", function() {""" + endOfFile)
    file.write("""    modal.style.display = "block";""" + endOfFile)
    file.write("""    player.playVideo();""" + endOfFile)
    file.write("""    player.loadVideoByUrl('https://www.youtube.com/v/2tzLruIYMcg?version=3',0,'large');""" + endOfFile)
    file.write("""  });""" + endOfFile)
    file.write("""  var pauseButton = document.getElementById("close");""" + endOfFile)
    file.write("""  pauseButton.addEventListener("click", function() {""" + endOfFile)
    file.write("""    modal.style.display = "none";""" + endOfFile)
    file.write("""    player.pauseVideo();""" + endOfFile)
    file.write("""  });""" + endOfFile)
    file.write("""}""" + endOfFile)
    file.write("""// When the user clicks anywhere outside of the modal, close it""" + endOfFile)
    file.write("""window.onclick = function(event) {""" + endOfFile)
    file.write("""  if (event.target == modal) {""" + endOfFile)
    file.write("""    modal.style.display = "none";""" + endOfFile)
    file.write("""    player.pauseVideo();""" + endOfFile)
    file.write("""  }""" + endOfFile)
    file.write("""}""" + endOfFile)
    file.write("""</script>""" + endOfFile)

# ----------------------------------------------------------------------------------
#                                main
# Main function
# Arguments : (Github Token)
# ----------------------------------------------------------------------------------
if __name__ == "__main__":
    githubToken = sys.argv[1]
    file_path = "index.html"
    print("Launch static website generation...")

    my_file = Path(file_path)
    if my_file.is_file():
        # file exist
        # remove the old index.html (or maybe do a diff at the end ?)
        print("Remove the file")
        os.remove(file_path)

    # Create the file
    file = open(file_path,'w')

    print("Start the code gen...")
    file.write("""<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">""" + endOfFile)
    file.write("""<html xmlns="http://www.w3.org/1999/xhtml">""" + endOfFile)
    addHtmlHeader(file)
    addHtmlBody(file, githubToken)
    #addHtmlFooter(file)
    addJavascript(file)
    file.write("""</html>""" + endOfFile)
    file.close()
    print("Code gen ended.")
