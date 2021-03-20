---
title: Battle-Simulator
description: Battle simulator made with JMonkey, using a graph model as back-end
stargazers-count: 2
forks-count: 0
updated-at: 2019-07-23 00:54:31
last-update-days: 499
tags: ['scala', 'jmonkeyengine3', 'battle-simulator', 'graphx', 'parallelization', 'graph', 'game']
languages: 
  - name: Java
    percentage: 86.2
    color: "#b07219"
  - name: Scala
    percentage: 13.8
    color: "#c22d40"

category: 'school'
pitch: "Developed for class Distributed Databases (8INF803) at UQAC (QC, CA).
        The GraphX API, which is Apache Spark's API for graphs and graph-parallel computation is used to create the back-end graph."
platforms: Windows
engines: JMonkey
tools: [MongoDB, GraphX]
duration: "2 months"
team-size:
  - role: Programmer
    amount: 3
main-roles: [Back-end Programmer, Gameplay Programmer, Front-end Programmeur]
video-link: -BDVJ9IO2uk
project_links:
  - name: github
    url: https://github.com/Graygzou/battle-simulator
additional-sections:
  - name: goals
    list: ["Understand graphs strength in the parallelization of tasks",
           "Compute a small turn based game with dungeon and dragons entities",
           "Learn JMonkey engine"]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/battle-simulator-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
