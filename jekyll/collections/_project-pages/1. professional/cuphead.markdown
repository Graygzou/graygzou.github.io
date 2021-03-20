---
title: Cuphead
description: UI polish and bugs fixes related to the localization of the game
tags: []
languages:
  - name: C#
    percentage: 90.0
    color: "#178600"
  - name: Others
    percentage: 10.0
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
tools: [Rewired, TextMeshPro, Git, Steam Upload, Jira, SDEV (Switch), Paint.net, Jenkins]
duration: "4 months"
team-size:
  - role: Programmer
    amount: 3 (2 abroad)
  - role: Producer
    amount: 2 (1 abroad)
remote-team: yes
main-roles: [UI Programmer, Game Programmeur]
project_links:
  - name: steam
    url: "https://store.steampowered.com/app/268910/Cuphead/"
  - name: gog-dot-com
    url: "https://www.gog.com/game/cuphead"
additional-sections:
  - name: tasks
    list: ["Adapt UI and text per language to have",
           "Integrate assets in the game for the specific languages.",
           "Correct bugs like UI animations, controllers, etc."]
  - name: constraints
    list: ["The English version must stay unchanged.",
           "The client must accept all the changes made (via screenshots)."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
I had the chance to work on Cuphead made by the MDHR studio during my internship.
I had to provide a high level of polish on an already launched game for his new update.

The main task were related to the UI but also some bugs:

| UI bugs fixes | UI Integration |
| UI animations bugs fixes | UI features (make the glow of the boss title) |
| controllers bugs | bring legacy branch up-to-date (git task) |
| localization bugs |  |

All of the above by keeping an eye on the English version.

#### What I've done
* Multi purpose script to move UI element based on the language.
* Custom editor to make the usage of this script easily.
* Deploy test build to steam (throught Steamwork) and GOG to test new controllers (Nintendo Switch and Steam controller).
* Communicate with the maximum of people involved to be sure what the game looks like was fine 
(even if most of the time they were checking, at the beginning at least).

<!--
To give an order of size Cuphead is :
- 81 death quotes
- 
In 11 new languages !-->

Post-Mortem
--------------------
#### What helps me a lot
* Cheats in the game (instant win, instant lose, switching between languages, etc.)
* Self organisation (with a bloc note / write (huge) comments on JIRA task)
* TextMeshPro features (font generation parameters, per character spacing (kerning), etc.)
* Work on my own branch and create side branch for bug (which will be rebase when finished)

#### What could be better (made by me)
* a lot of tasks involved manual QA from me. Which is painful. 
* Not use -f (force) when using git command (I guess we all have been there...)
* A tool that take screenshot automatically of the same configuration in many languages would have been super useful.