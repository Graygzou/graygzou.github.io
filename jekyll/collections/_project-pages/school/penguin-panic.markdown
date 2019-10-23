---
layout: project-page
title: penguin-panic
description: 3D exploration, arcade game made for the Ubisoft Game Lab Competition 2018
tags: ['unity3d', 'Water Research', 'Adaptative AI']
languages: 
  - name: C#
    percentage: 80.87
    color: "#178600"
  - name: HLSL
    percentage: 11.25
    color: "#ccc"
  - name: ShaderLab
    percentage: 7.7
    color: "#ccc"
  - name: GLSL
    percentage: 0.19
    color: "#ccc"
category: 'school'
pitch: "Penguin Panic is a 3D multiplayer exploration game. 
        It has been made for the Ubisoft Game Lab Competition 2018. 
        A brief description of this event is available here: [Ubisoft Game Lab Competition](https://montreal.ubisoft.com/en/our-engagements/education/university/game-lab-competition).
        
        **Award of the Best Technical Challenge and Innovation.**   
        
        Our story takes place in 2042s. Human activity has continued to spread, bringing with it the progression of global warming.   
        The Arctic is falling apart and the North Pole is drifting in the ocean.   
        While the situation is critical, a duo of scientists who study the glacial regions makes a strange discovery: the penguins are organizing to bring the Glacier to the North Pole!   
        Amazed by what they have in front of them, the two scientists have a revelation: the courage of these little penguins could well inspire the whole world!   
        They decided to launch a broadcast on a real-time streaming platform very popular in recent years: Twatch.tv.   
        You play the leader penguin of this colony. Your mission: return the Glacier to the North Pole to save the Arctic!"
pinned: true
platforms: Windows
engines: Unity3D
tools: [Asset Store]
duration: "2 months"
team-size:
  - role: Programmers
    amount: 8
main-roles: [R&D, AI Programmer, UI Programmer, Game Programmeur, Animator]
project_links:
  - name: gamejolt
    url: https://gamejolt.com/games/penguin-panic/330630
constraints:
  - The game needs to highlight a real social cause.
  - The game needs to include an AI that change depending on players behaviors.
  - The game needs to include a multiplayer aspect.
  - The game needs to be played with an XBOX 360 controller.
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/penguin-panic-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
