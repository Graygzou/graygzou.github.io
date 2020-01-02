---
layout: project-page
title: lode-runner
description: 2D platformer and puzzle game made with DygaEngine based on the original "Lode Runner"
stargazers-count: 0
forks-count: 0
updated-at: 2019-07-22 23:27:41
last-update-days: 161
tags: ['video-game', '2d-platformer-game', 'puzzle-game', 'dygaengine']
languages: 
  - name: Java
    percentage: 100.0
    color: "#b07219"

category: 'school'
pitch: "_Lode Runner - The Legend Return_ is a platform game published by Broderbund in 1983.
         Unlike others platforms published at the same time, _Lode Runner - The Legend Return_ is more a puzzle-oriented platform game.
         We decided to reproduced this game for a school project at the Higher educational institution in Toulouse (ENSEEIHT).
         The course was an object-oriented programming course.
         <br/>
         <br/>
         Lode Runner is composed of several levels presented in a single screen.
         The player character, Jake Peril, has to collect all the treasure (golds with different value) and reach the exit.
         Mad Monks are also here to protected treasures by capturing Jake. Those wears red robes."
platforms: Windows
engines: dyga-engine
tools: [Eclipse]
duration: "3 months"
team-size:
  - role: Programmers
    amount: 4
main-roles: [Project Manager, Engine Programmer, Gameplay Programmeur]
project_links:
  - name: github
    url: https://github.com/dyga-entertainment/lode-runner
additional-sections:
  - name: goals
    list: ["Validate Object-Oriented Programming skills.",
           "Use design patterns in the game.",
           "Make simple, yet effective, artificial intelligences for enemies.",
           "Make a self-taught game."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/lode-runner-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
