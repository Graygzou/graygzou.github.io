---
layout: project-page
title: advent-of-code
description: My solutions for Advent of Code (AoC) challenges.
stargazers-count: 0
forks-count: 0
updated-at: 2019-07-23 02:08:56
last-update-days: 103
tags: ['lua', 'aoc', 'advent-of-code']
languages: 
  - name: Lua
    percentage: 100.0
    color: "#000080"

category: 'side'
pitch: "Advent of Code is an Advent calendar of small programming puzzles for a variety of skill sets and skill levels that can be solved in any programming language we like.
        People use this event as a speed contest, practice problems, or even to challenge each other.
        It's made by Eric Wastl and 2018 was the 4th edition."
platforms: Windows
tools: [Lua]
duration: "1 month"
team-size:
  - role: Programmer
    amount: 1
main-roles: [Programmer]
project_links:
  - name: github
    url: https://github.com/Graygzou/advent-of-code
additional-sections:
  - name: goals
    list: ["Challenge myself.",
           "Discover new things (new language, new problems, etc.)",
           "Share with my friends possible solutions and optimizations."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/advent-of-code-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
