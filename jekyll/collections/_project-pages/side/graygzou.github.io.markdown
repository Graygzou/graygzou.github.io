---
layout: project-page
title: graygzou.github.io
description:  Github portfolio made from scratch.
stargazers-count: 0
forks-count: 0
updated-at: 2019-10-23 19:25:24
last-update-days: 0
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
languages: 
  - name: HTML
    percentage: 44.9
    color: "#e34c26"
  - name: Python
    percentage: 22.9
    color: "#3572A5"
  - name: CSS
    percentage: 22.0
    color: "#563d7c"
  - name: Ruby
    percentage: 9.1
    color: "#701516"
  - name: Shell
    percentage: 1.1
    color: "#89e051"

category: 'side'
pitch: "Wonderful website I made using jekyll and liquid to build what I want. Using Github API also."
platforms: Web
tools: [jekyll, liquid, python]
duration: "In progress"
team-size:
  - role: Programmer
    amount: 1
main-roles: [Front-End Programmeur, Tools Programmer]
project_links:
  - name: github
    url: https://graygzou.github.io/
goals:
  - Automatise my website to avoid spending hours to update it.
  - Learn Jekyll and Liquid tag system.
  - Build an automatisation flow to run all kind of stuffs before deploying it to GitHub.
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/graygzou.github.io-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
