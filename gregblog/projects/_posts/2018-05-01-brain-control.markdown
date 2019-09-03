---
layout: project-page
title:  "Brain Control"
date:   2018-05-01 00:00:00 -0400
platforms: Windows PC
engines: Unity
tools: [Unity, Asset Store]
duration: "48 hours"
team-size: 7
main-roles: [AI Programmer, Game Programmer]
github-link: https://github.com/Graygzou/Brain-Control
gamejolt-link: https://gamejolt.com/games/BrainControl/323988
---

Overview
--------------------
Brain Control is a top down 2D game, similar to a Quake-style deathmatch. This application has been completed for a GameJam called the WonderJAM organised by the Université du Québec à Chicoutimi (UQAC). The official website of this event is the following : WonderJAM Winter 2018.

You play as survivors from a deadly virus which turn humans into zombies. Your objectif is to be the last survival alive to be able to build an army of zombies. Players can't attack each other direclty and have to use zombies to do so. Each time a zombie is killes by one player, it resurrect, thanks to the bullets they used. Once resurrected, he attacks the other player. Moreover, each players is losing life over time and can only gain back some by killing standard zombies.

Screenshots
--------------------

TODO: Add images ?

Detailed Info
--------------------
### IA
#### Pathfinding
During this gamejam, i wanted to make a pathfinder to avoid collisions easily bewteen zombies and walls. I start developping an A* algorithm based on an existing one but adapted to our needs. Unfortunalty, I did not realize at that point that this kind of algorithm will not be efficient in our case because players are moving entities. Even if I did received course on that topic, I did not though about it until I test it with several zombies. I finally dropped this idea to develop and alternative to make zombies avoid obstacles.

#### Force based movement
To overcome the previous issue, I developped a basic movement was a classic Seek to the player without wall-avoidance. this allowed my team to make tests and move forward. After that, I made a wall-avoidance to make zombies behavior more realistic by avoiding obstacles.
