---
layout: project-page
title: graygzou.github.io
description: Github portfolio made from scratch.
stargazers-count: 0
forks-count: 0
updated-at: 2019-10-11 01:57:15
last-update-days: 3
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
languages: 
  - name: HTML
    percentage: 43.9
    color: "#e34c26"
  - name: Python
    percentage: 23.4
    color: "#3572A5"
  - name: CSS
    percentage: 21.7
    color: "#563d7c"
  - name: Ruby
    percentage: 9.8
    color: "#701516"
  - name: Shell
    percentage: 1.2
    color: "#89e051"

category: 'side'
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

---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/graygzou.github.io-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
