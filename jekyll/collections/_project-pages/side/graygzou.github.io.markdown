---
layout: project-page
title: graygzou.github.io
description:  Github portfolio made from scratch.
stargazers-count: 0
forks-count: 0
updated-at: 2019-11-03 21:36:25
last-update-days: 0
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
languages: 
  - name: HTML
    percentage: 45.0
    color: "#e34c26"
  - name: CSS
    percentage: 22.9
    color: "#563d7c"
  - name: Python
    percentage: 22.2
    color: "#3572A5"
  - name: Ruby
    percentage: 8.9
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
main-roles: [Front-End Programmer, Tools Programmer, Theme Programmer]
project_links:
  - name: github
    url: https://graygzou.github.io/
additional-sections:
  - name: goals
    list: ["Automatise my website to avoid spending hours to update it.",
           "Learn Jekyll and Liquid tag system.",
           "Use GitHub API to synchronize projects data directly from GitHub."
           "Build an automatization flow to run all kind of stuffs before deploying it to GitHub."]
  - name: constraints
    list: ["Don't own a server yet so no back-end can be used."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/graygzou.github.io-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
