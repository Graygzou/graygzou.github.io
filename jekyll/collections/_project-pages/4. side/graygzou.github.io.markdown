---
title: graygzou.github.io
description:  Personal portfolio made with jekyll with my own theme.
stargazers-count: 0
forks-count: 1
updated-at: 2019-12-06 02:02:51
last-update-days: 25
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
languages: 
  - name: HTML
    percentage: 35.7
    color: "#e34c26"
  - name: Python
    percentage: 28.9
    color: "#3572A5"
  - name: CSS
    percentage: 19.9
    color: "#563d7c"
  - name: Ruby
    percentage: 7.7
    color: "#701516"
  - name: Shell
    percentage: 5.4
    color: "#89e051"
  - name: JavaScript
    percentage: 2.5
    color: "#f1e05a"

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
           "Use GitHub API to synchronize projects data directly from GitHub.",
           "Build an automatization flow to run all kind of stuffs before deploying it to GitHub."]
  - name: constraints
    list: ["Using GitHub page to host it so no back-end can be used.",
           "Don't own an address so have to use the standard GitHub one."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/graygzou.github.io-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
