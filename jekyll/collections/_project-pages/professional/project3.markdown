---
layout: project-page
title: Unannonced-title
description: Tracking and bugs fixes on an unannonced title
tags: []
languages:
  - name: C++
    percentage: 25.0
    color: "#f34b7d"
  - name: C#
    percentage: 25.0
    color: "#178600"
  - name: SQL
    percentage: 25.0
    color: "#178600"
  - name: Others
    percentage: 25.0
    color: "#178600"
tags: ['Back-end', 'unity3d', 'Analytics implementation',  'Tools', 'Bugs fixes']
category: 'professional'
pitch: "I cannot talk about this project since it hasn't been soft launch yet.. Worked during 6 months on an unannounced title."
pinned: true
platforms: Android, iOS
engines: Unity3D
tools: [Perforce, RabbitMQ, MariaDB, LXC, DeltaDNA, AppsFlyer, JIRA, Confluence]
duration: "6 months"
team-size:
  - role: Programmers
    amount: 7
  - role: Game Designers
    amount: 3
  - role: Producer
    amount: 1
  - role: world-wide
    amount: 10-20*
remote-team: yes
main-roles: [Analytics Programmer, Game Programmeur]
additional-sections:
  - name: tasks
    list: ["Help analysis known the game and create analytics events with them.",
           "Implements all the analytics events in the game (client side, server side, lobby side).",
           "Implementation of cheats on the lobby.",
           "Bugs fixes of the lobby part.",
           "SDKs Integration (DeltaDNA, AppsFlyer)."]
  - name: constaints
    list: ["Interact in English with the client and other teams around the world.",
           "Respect the deadlines.",
           "Find arrangement with non tech team like Business Intelligent (BI), etc."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
Unannounced yet.

### What I've done
Most of my work sat on two aspects:
- Analytics on all parts of the game
- Final game cheats, setup environments for the team.

#### Tracking
I had to adapt to the client needs of course but also explains what could be tracked nicely and what couldn't.  

I end-up doing a lot of meetings with BI team and some tech leads in order to discuss about which question events helps answering and how the will help answering it.  

In a technical side, I tried to not adapt the game to the tracking but the opposite. 
Of course, I had discussion with colleagues on why things were that way and what could be better in order to extends the game and could make the tracking more flexible.
Because, since charts will come up tracking data, we have to plan ahead and see what we would like to track and possibly the coming features not yet implemented.

#### Cheats
Most of the cheats were already inside the game but were only client side. 
This was made that way because the back-end part (lobby) was made after the client and designers/QAs needed a way to test every part of the game.
So I had to move and add additional cheats on the lobby.  

I had to create special message between the client and the lobby only active when the lobby config allows it.
And finally adapt the existing code in C# into C++ code. 
Some cheat were really straight forward while others needed a deeper understanding of the lobby logic.
An example of harder cheat was clearing erasing the player progression and removing the player profile.
In the legacy client version (Unity), we only needed to `ClearPlayerPrefs()` while on the new lobby side, we need to erase data inside the DB attached to the lobby. 
This required more works overall and many more system interactions than a simple call.

#### Help the team moving to the full pipeline
I had to setup environments for the on-site team.
In fact, I was the first person on our team to have access to the full pipeline in order to implements events in every part of it.
The problem was that it require a lot of resources in order to run the full pipeline on one machine :   
* a Virtual Machine to run the DB/RabbitMQ with specific settings, 
* 2 Unity to run both the client, and the server,
* 3 `.exe` running which basically represents the lobby.

I finally setup VM like with Linux Containers (LXC) to create lobby instance that everyone could connect to in order to play the game as normal.
I had to ask a lot of question to the client tech team in order to know what dependencies I needed to run each Centos 7 container correctly.

Post-Mortem
--------------------