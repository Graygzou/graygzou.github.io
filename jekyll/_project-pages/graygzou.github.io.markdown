---
layout: project-page
title: graygzou.github.io
description: Github portfolio made from scratch.
color: "#e34c26"
language: HTML
stargazers-count: 0
forks-count: 0
updated-at: 2019-09-08 16:21:52
last-update-days: 6
tags: ['portfolio', 'html-css', 'javascript', 'python', 'code-generation', 'github-api']
platforms: Web
tools: [jekyll, liquid, python]
duration: "In progress"
team-size: 1
main-roles: [Front-End Programmeur, Tools Programmer]
github-link: https://graygzou.github.io/
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

{% capture my_include %}
{% include projects-content/graygzou.github.io-content.markdown %}
{% endcapture %}
{{ my_include | markdownify }}
