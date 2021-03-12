---
layout: project-page
title: Spida-Phobia
description: Virtual Reality simulation that helps people suffering from arachnophobia.
stargazers-count: 0
forks-count: 0
updated-at: 2019-07-23 01:53:04
last-update-days: 499
tags: ['virtual-reality', 'aracnophobia', 'unreal-engine-4', 'simulation']
languages: 
  - name: C++
    percentage: 96.7
    color: "#f34b7d"
  - name: C#
    percentage: 3.1
    color: "#178600"
  - name: C
    percentage: 0.2
    color: "#555555"

category: 'school'
pitch: "Spida-Phobia is a 3D Virtual Reality application made for a school project at the Université du Québec à Chicoutimi (UQAC).
        The course is the following : 3D interaction and virtual reality (8INF849).
        <br/>
        <br/>
        This application is design to help people scared of spiders.
        The player can go through differents levels that involve different type of spiders.
        Visual of spiders can change (color, behavior, size). Each level contains a unique environment.
        Finally, haptic vibration are used to emphasis the immersion."
platforms: Windows
engines: Unreal
tools: [Steam VR, Market Store, Gimp]
duration: "2 months and half"
team-size:
  - role: Programmers
    amount: 4
main-roles: [Project Manager, Game Programmer, Game Designer]
project_links:
  - name: github
    url: https://github.com/dyga-entertainment/spida-phobia
additional-sections:
  - name: goals
    list: ["Learn Unreal Engine 4.",
           "Make my first VR application",
           "Gamify a concept like phobias in order to help people."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/spida-phobia-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
