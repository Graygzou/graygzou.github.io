---
layout: project-page
title: colosseum-overcharge
description: 2.5D multiplayer brawler game made in 48 hours* for the Ludum Dare 45 (2019).
color: "#178600"
language: C#
languages:
    - name: C#
      percentage: 100.0
      color: green
tags: ['unity3d', 'gamejam', 'gmtk2019', 'puzzle-game']
category: 'side'
pitch: "Colosseum Overcharge is a 2.5D multiplayers brawler. This game has been made for the Ludum Dare 45 (2019). 
        The official website of this event is the following: Ludum dare 45.
        <br/><br/>
        An Arena Couch game where the goal is to destroy your friends by knocking them into dangerous objects! 
        As the game progresses your little robot that started with nothing will be able to upgrade and use new mechanics in hopes of winning the next round !
        <br/><br/>
        * We only worked for 48 hours since we were working the monday (we took a bit of time on that day to fix small bugs and submit the project)"
platforms: [Windows]
engines: Unity3D
tools: [Rewired, ProBuilder]
duration: "48 hours*"
team-size:
    - role: Programmers
      amount: 3
    - role: Artist
      amount: 1
    - role: Animator
      amount: 1
    - role: Game Designers
      amount: 2
main-roles: [Gameplay Programmer, UI Programmer]
project_links:
  - name: ludum-dare
    url: https://ldjam.com/events/ludum-dare/45/colosseum-overcharge
additional-sections:
  - name: goals
    list: ["Challenge myself",
           "First participation of the Ludum Dare GameJam",
           "Work with a pluridisciplanary team members, who I've never worked before."]
  - name: constraints
    list: ["Theme: start with nothing"]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/colosseum-overcharge.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
