---
layout: project-page
title: graygzou.github.io
description: Github portfolio made from scratch.
stargazers-count: 0
forks-count: 0
updated-at: 2019-09-23 22:39:21
last-update-days: 0
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
languages: 
  - name: HTML
    percentage: 43.4
    color: "#e34c26"
  - name: Python
    percentage: 22.9
    color: "#3572A5"
  - name: CSS
    percentage: 22.2
    color: "#563d7c"
  - name: Ruby
    percentage: 10.2
    color: "#701516"
  - name: Shell
    percentage: 1.3
    color: "#89e051"

category: 'side'
platforms: Web
tools: [jekyll, liquid, python]
duration: "In progress"
team-size: 1
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
