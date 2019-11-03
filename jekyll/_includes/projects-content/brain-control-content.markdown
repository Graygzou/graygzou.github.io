<!---
Grégoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
--->

Screenshots
--------------------
{% include helpers/project-carousel %}

Detailed Info
--------------------
### IA
#### Pathfinding
During this Game Jam, I wanted to make a pathfinder to avoid collisions easily between zombies and walls. I start developing an A* algorithm based on an existing one but adapted to our needs. Unfortunately, I did not realize at that point that this kind of algorithm will not be efficient in our case because players are moving entities. Even if I did received course on that topic, I did not though about it until I test it with several zombies. I finally dropped this idea to develop and alternative to make zombies avoid obstacles.

#### Force based movement
To overcome the previous issue, I developed a basic movement was a classic Seek to the player without wall-avoidance. this allowed my team to make tests and move forward. After that, I made a wall-avoidance to make zombies behavior more realistic by avoiding obstacles.
