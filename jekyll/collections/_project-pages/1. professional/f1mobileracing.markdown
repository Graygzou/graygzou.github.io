---
layout: project-page
title: F1-Mobile-Racing
description: Add feature, improvements and bug fixes on both client and server.
tags: []
languages:
  - name: C#
    percentage: 70.0
    color: "#178600"
  - name: C#
    percentage: 30.0
    color: "#178600"
  - name: Javascript
    percentage: 30.0
    color: "#178600"
tags: ['unity3d', 'Architectures', 'Back-end', 'Bugs fixes', 'Code review']
category: 'professional'
pitch: "_F1® Mobile Racing_ est un jeu mobile officiel du championnat _FIA FORMULA ONE WORLD CHAMPIONSHIP™_.
        The core gameloop of the game is around duels between players in a race that can take several forms (grid start, overtaking, etc.)
        <br/>
        Player are able to customize their own f1 car by adding stickers and livery on it.
        They can also select the helmet they want to use, pilots or cars, based on real formula 1 ones.
        Tracks also correspond to the official one pilots were running on.
        <br/>
        If players didn't want to play against other player, they could either play:
        - Single mode were they're able to train on available tracks, or
        - GPEvents which simulate Grand Prix and allows player to win points based on their performances. 
        <br/>
        Global leaderboards are available in the later to let players compare their cumulated points if needed."
pinned: true
platforms: Android, iOS
engines: Unity3D
tools: [Git, Perforce, Gamesparks, UnityAds, TextMeshPro,  JIRA]
duration: "1 year"
team-size:
  - role: Programmers
    amount: 5 (on site)
  - role: Designer
    amount: 1 (on site)
  - role: Artists
    amount: 3 (on site)
  - role: Producers
    amount: 1 (on site)
  - role: Build master
    amount: 1 (on site)
  - role: QAs
    amount: 1 (on site) + 4 (abroad)
  - role: Support
    amount: 2 (on site)
remote-team: yes
main-roles: [Gameplay Programmer, Back-end Programmer, UI Programmer)]
project_links:
  - name: android
    url: "https://play.google.com/store/apps/details?id=com.codemasters.F1Mobile&hl=fr&gl=US"
  - name: apple
    url: "https://apps.apple.com/fr/app/f1-mobile-racing/id1343820018"
additional-sections:
  - name: tasks
    list: ["Create new features to enhance the gameplay in the game",
           "Fix bugs of any kind to improve the user experiences",
           "Manage a feature by tracking the progress, obstacles until the completion of it"]
  - name: constraints
    list: ["Work with some heavy codebase with legacy usages", 
           "Work with short deadlines",
           "Constant trade-off between only fixing the bug or reworking this part overall"]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2021 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
I worked around 1 year on the live version. I participated in 5 updates, from update 11 to 15 included on both Android and iOS platform.
The project had a similar, yet simpler, architecture of my previous project so wrapping up in ity wasn't a problem.
in particular, the client-server approach was there. 
What makes it simpler was the server side which was fully managed by Gamesparks, which allow to parametrized stuff directly in web interfaces.

Even if I got a full picture of the architecture I did not had the chance to dig every part of it due to account number restrictions. 
Indeed, we used git for the server part whereas Perforce was used for the rest of the project.

Later on, I was able to join the server git and even work on it to implements features.

#### What I've done
I had the chance to work on several different part of the project.
I always try to improve the codebase while I was fixing bugs. Sometimes, a whole rework was necessary to make bugs dissapear. 
In the later case, the starting logic was too ambiguous. 

##### Features
* Part recycling feature
* Esport phase 
* Ghost mode prototype
* Include new features in tutorial (league progression, ghosts)
* Activating DRS at the beginning of a race if necessary
* Gamertag system (server side)
* Schumacher/Halloween Event (server side)

##### Code Improvements
* Rework of Ads management.
* Creation of UI systems for similar behavior.
* Generalisation of tutorial step.

Post-Mortem
--------------------
#### What helped me a lot
* Drawing diagrams to better understand the interaction of each classes to achieve a goal. 
* Planning and thinking before starting coding: This allows me to better tackle a system rework that was not planned at first. And justify it to my collegues.
* Asking my pair about their work: Sometimes existing code made by them was already there that could solve my problem.
* Challenging my lead and project manager: This allows to have changes like giving access to server code for the entire team. And having a better understanding on the architecture with a quick masterclass on it (I believe the team was not big enough to justify the need to have dedicated roles).

(TODO)
* Using wisely task streams in Perforce just like I used branching in git to avoid problems.

#### What could I do better
* Include more tests as I was fixing bugs and improving the codebase overall
* Create more documentation on the systems I made. And updating them at the end of the feature / improvements.
* Ask for meeting to present ideas like introducing a naming convention, creating good architecture to avoid starting over everytime, or even the need to have as soon as possible automated build like Jenkins.
