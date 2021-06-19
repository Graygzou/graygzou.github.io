---
title: Metenorage
description: A 3D voxel engine (ECS) based on LWJGL and JBullet.
date: 2017-04-04
stargazers-count: 0
forks-count: 0
updated-at: 2019-07-22 23:24:54
last-update-days: 610
tags: ['game-engine', 'lwjgl', 'entity-component-system', 'opengl', 'openal', 'jbullet', 'glfw']
languages: 
  - name: Java
    percentage: 98.5
    color: "#b07219"
  - name: GLSL
    percentage: 1.5
    color: "#ccc"
published: false
category: 'school'
pitch: "Metenorage is a Java engine made for a school project at the Université du Québec à Chicoutimi (UQAC).
        The course is the following : [Game Engines Principles (8INF871)](http://cours.uqac.ca/8INF871).
        <br/>
        <br/>
        We implemented this engine in Java with the framework [LWJGL](https://www.lwjgl.org/) (Lightweight Java Game Library).
        We choose to based our engine on a Entity-Component-System (ECS) architecture because of his modularity and flexibility."
platforms: Windows
tools: [Intellij, LWJGL, JBullet]
duration: "1 months"
team-size:
  - role: Programmers
    amount: 4
main-roles: [Engine Programmer, Game Programmeur]
youtube-link: ORAGPZGMJg4
project_links:
  - name: github
    url: https://github.com/Graygzou/metenorage
additional-sections:
  - name: goals
    list: ["Create a game engine which is modular and flexible.",
           "Enable users to create 2D and 3D games.",
           "Implements basics systems to create simple games.",
           "Keep the engine \"clean\" by splitting it from metadata (scripts and resources).",
           "Facilitate the creation of games with an editor."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/metenorage-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
