---
layout: project-page
title: graygzou.github.io
description:  Personal portfolio made with jekyll with my own theme.
stargazers-count: 0
forks-count: 1
updated-at: 2021-03-22 12:38:34
last-update-days: 0
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api', 'continuous-integration', 'bash-script']
languages: 
  - name: HTML
    percentage: 29.6
    color: "#e34c26"
  - name: Python
    percentage: 27.0
    color: "#3572A5"
  - name: Shell
    percentage: 18.4
    color: "#89e051"
  - name: SCSS
    percentage: 17.0
    color: "#c6538c"
  - name: Ruby
    percentage: 6.1
    color: "#701516"
  - name: JavaScript
    percentage: 1.9
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
