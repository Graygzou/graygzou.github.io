---
layout: project-page
title: graygzou.github.io
description: Github portfolio made from scratch.
color: "#e34c26"
language: HTML
stargazers-count: 0
forks-count: 0
updated-at: 2019-09-21 03:10:43
last-update-days: -1
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
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
