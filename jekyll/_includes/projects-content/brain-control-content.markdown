<!--- Grégoire Boiron <gregoire.boiron@gmail.com> --->
<!--- Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved. --->

Screenshots
--------------------
{% include helpers/project-carousel %}

Detailed Info
--------------------
All my work on this jam was around artificial intelligence. I was supposed to make ennemis movements in both phase of the game: going toward the closest player in phase 1 and going to a given player in phase 2.

### Pathfinding with A*
During this Game Jam, I wanted to make a pathfinder to avoid collisions easily between zombies and walls. I start developing an A* algorithm based on an existing one but adapted to our needs. 

I started based on a free asset available on the store. But this version was not optimal enough so I had to tweak and optimize it in order to make it work as I wanted.

### Difficulties
Unfortunately, I did not realize at that point that this kind of algorithm will not be efficient in our case because players are moving entities. Even if I did received course on that topic, I did not though about it until I test it with several zombies. I finally dropped this idea to develop and alternative to make zombies avoid obstacles and still reach their targets.

### Force based movement
To overcome the previous issue, I developed a basic movement was a classic Seek to the player without wall avoidance. This allowed my team to make tests and move forward. After that, I made a wall avoidance to make zombies behavior more realistic by avoiding obstacles.

### Post-mortem
#### What went good
- Implemented quickly another solution after the first one failed.
- Completed my first game jam.

#### What could be improved
- Think twice on pros and cons of using a technique before doing it.
- Reaching a prototype quicker to experience with solutions and have time to find appropriate solutions. 
