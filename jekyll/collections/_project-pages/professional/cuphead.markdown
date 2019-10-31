---
layout: project-page
title: cuphead
description: UI polish and bugs fixes related to the localization of the game
tags: []
languages:
  - name: C#
    percentage: 100.0
    color: "#178600"
tags: ['unity3d', 'UI related to localization', 'UI integration', 'Bugs fixes', 'Tools']
category: 'professional'
pitch: "_Cuphead_ is a 2D Run and gun game published by StudioMDHR in 2017.
         His gameplay is centered around continual boss fights, with interspersed run and gun levels.
         <br/>
         <br/>
         I worked on the major patch of April 2019 which contains, the nintendo switch released, Mugman mode and localization in 11 languages of the game.
         Most of my work where on the UI to fix bugs related to all the new languages in the game.
         <br/>
         <br/>
         More details of this game can be found here : [wikipedia](https://en.wikipedia.org/wiki/Cuphead)"
pinned: true
platforms: Windows, Linux, Mac, Nintendo Switch
engines: Unity3D
tools: [Rewired, TextMeshPro Git, Steam Upload, JIRA, SDEV (Switch), Paint.net, Jenkins]
duration: "4 months"
team-size:
  - role: Programmer
    amount: 1 (on site)
  - role: Producer
    amount: 1 (on site)
remote-team: yes
main-roles: [UI Programmer, Game Programmeur]
project_links:
  #- name: steam
  #  url: todo
additional-sections:
  - name: tasks
    list: ["Work on an existing projects and polish it.",
           "Adapt UI per languages but keep the English version unchanged.",
           "Integrate assets in the game for the specific languages."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Overview
--------------------
I had the chance to work on Cuphead made by the MDHR studio during my internship. The main task

### UI related
- UI bugs fixes, 
- UI Integration
- UI animations bugs fixes
- UI features (make the glow of the boss title)

### Tools related
- controllers bugs
- localization bugs

### Others
- bring legacy branch up-to-date (git task) 

ALL of the by keeping an eyes on the English version.

{% capture links_include %}
{% include helpers/project-links %}
{% endcapture %}
{{ links_include | markdownify }}

### What I've done
* Multi purpose script to move UI element based on the language.
* Custom editor to make the usage of this script easily.
* Deploy test build to steam (throught Steamwork) and GOG to test new controllers (Nintendo Switch and Steam controller).
* Communicate with the maximum of people involved to be sure what the game looks like was fine 
(even if most of the time they were checking, at the beginning at least).

### What helps me a lot
* Cheats
* Self organisation (with a bloc note / write (huge) comments on JIRA task)
* TextMeshPro features (font generation parameters, per character spacing (kerning), etc.)
* Work on my own branch and create side branch for bug (which will be rebase when finished)

### What could be better (made by me)
* a lot of tasks involved manual QA from me. Which is painful. 
* Not use -f (force) when using git command (I guess we all have been there...)
A tool that take screenshot automatically of the same configuration in many languages would have been super useful.
To give an order of size Cuphead is :
- 81 death quotes
- 
In 11 new languages !

### More details
* fefe

Screenshots
--------------------
In progress.

Detailed Info
--------------------
Back and forth with the translation team. Find solutions to make speech bubbles great.


Difficulty =
