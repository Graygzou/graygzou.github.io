---
layout: project-page
title: Brain-control
description: Top down 2D game, made with Unity engine for the WonderJam 2018.
stargazers-count: 1
forks-count: 0
updated-at: 2019-07-24 00:24:25
last-update-days: 498
tags: ['unity', '2d-game', 'survival-game', 'multiplayer-game', 'kill-zombies', 'steering-behaviors']
languages: 
  - name: C#
    percentage: 65.8
    color: "#178600"
  - name: ShaderLab
    percentage: 31.4
    color: "#ccc"
  - name: HLSL
    percentage: 1.5
    color: "#ccc"
  - name: GLSL
    percentage: 0.7
    color: "#ccc"
  - name: Shell
    percentage: 0.6
    color: "#89e051"
  - name: XSLT
    percentage: 0.1
    color: "#EB8CEB"

category: 'side'
pitch: "Brain Control is a top down 2D game, similar to a Quake-style deathmatch.
        This application has been completed for a Game Jam called the WonderJAM organized by the Université du Québec &#224 Chicoutimi (UQAC).
        The official website of this event is the following : [WonderJAM Winter 2018](http://jam.aemi.ca/).
        <br/>
        You play as survivors from a deadly virus which turn humans into zombies.
        Your objective is to be the last survival alive to be able to build an army of zombies.
        Players can't attack each other directly and have to use zombies to do so.
        Each time a zombie is killed by one player, it resurrect, thanks to the bullets they used.
        Once resurrected, he attacks the other player.
        Moreover, each players is losing life over time and can only gain back some by killing standard zombies."
platforms: Windows
engines: Unity3D
tools: [Unity, Asset Store]
duration: "48 hours"
team-size:
  - role: Programmer
    amount: 7
main-roles: [IA Programmer, Gameplay Programmer]
project_links:
  - name: github
    url: https://github.com/Graygzou/brain-control
  - name: gamejolt
    url: https://gamejolt.com/games/BrainControl/323988
additional-sections:
  - name: contraints
    list: ["Theme: Order and Disorder.",
           "Imposed words: Arcade, Survival, Multiplayers."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/brain-control-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
