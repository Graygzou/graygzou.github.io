<!---
Grégoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018 Grégoire Boiron  All Rights Reserved.
--->

Overview
--------------------
Brain Control is a top down 2D game, similar to a Quake-style deathmatch. This application has been completed for a Game Jam called the WonderJAM organized by the Université du Québec &#224 Chicoutimi (UQAC). The official website of this event is the following : <a href="http://jam.aemi.ca/">WonderJAM Winter 2018.

You play as survivors from a deadly virus which turn humans into zombies. Your objective is to be the last survival alive to be able to build an army of zombies. Players can't attack each other directly and have to use zombies to do so. Each time a zombie is killed by one player, it resurrect, thanks to the bullets they used. Once resurrected, he attacks the other player. Moreover, each players is losing life over time and can only gain back some by killing standard zombies.

#### Constraints
* Theme : Order and Disorder.
* Imposed words : Arcade, Survival, Multiplayers.

{% capture links_include %}
{% include helpers/project-links %}
{% endcapture %}
{{ links_include | markdownify }}

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
