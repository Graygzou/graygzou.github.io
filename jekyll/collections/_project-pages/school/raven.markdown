---
layout: project-page
title: raven
description: Top down 2D game, similar to a Quake-style deathmatch.
stargazers-count: 2
forks-count: 0
updated-at: 2019-07-22 23:23:09
last-update-days: 161
tags: ['artificial-intelligence', 'top-down-shooter', 'neural-network', 'fuzzilogic', 'goal-oriented-action-planning', 'steering-behaviors']
languages: 
  - name: C++
    percentage: 39.2
    color: "#f34b7d"
  - name: C
    percentage: 35.5
    color: "#555555"
  - name: HTML
    percentage: 22.3
    color: "#e34c26"
  - name: Lua
    percentage: 0.8
    color: "#000080"
  - name: Makefile
    percentage: 0.7
    color: "#427819"
  - name: Python
    percentage: 0.6
    color: "#3572A5"
  - name: Roff
    percentage: 0.4
    color: "#ecdebe"
  - name: CSS
    percentage: 0.2
    color: "#563d7c"
  - name: PostScript
    percentage: 0.1
    color: "#da291c"
  - name: Clarion
    percentage: 0.0
    color: "#db901e"
  - name: Batchfile
    percentage: 0.0
    color: "#C1F12E"
  - name: Objective-C
    percentage: 0.0
    color: "#438eff"

category: 'school'
pitch: "Raven is a top down 2D game, similar to a Quake-style deathmatch.
        It is originaly made by Mat Bucklandin his book, Programming Game AI By Example.
        This application has been completed for a school project at the Université du Québec à Chicoutimi (UQAC).
        The course is the following: [Artificial Intelligence for Video Games (8IAR125)](http://cours.uqac.ca/8IAR125).

        The gameplay of Raven is similar of a Quake-style deathmatch.
        When starting the game, severals bots spawned controlled by similar AI trying to win, by killing as many bots as possible.
        Bots can also pick up health or weapons if needed. The player could also take control of a bot by clicking on it.
        Ones the bot is controlled, some actions were possible like firing, switching weapons, etc."
platforms: Windows
tools: [Visual Studio, Lua]
duration: "1 month"
team-size:
  - role: Programmers
    amount: 6
main-roles: [Project Manager, IA Programmer, Gameplay Programmer]
project_links:
  - name: github
    url: https://github.com/Graygzou/raven
additional-sections:
  - name: goals
    list: ["Learn and apply AI techniques used in video games.",
           "Try making a neural network to train an AI.",
           "Improved the game by adding more modes (team deathmatch, 1vs1)",
           "Improved the game by adding more features (weapons, maps, ...)."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/raven-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
