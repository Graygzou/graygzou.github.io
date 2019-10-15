<!---
Grégoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018 Grégoire Boiron  All Rights Reserved.
--->

Overview
--------------------
"Lode Runner - The Legend Return" is a platform game published by Broderbund in 1983. 
Unlike others platforms published at the same time, "Lode Runner - The Legend Return" is more a puzzle-oriented platform game. 
We decided to reproduced this game for a school project at the Higher educational institution in Toulouse (ENSEEIHT). 
The course was an object-oriented programming course.

Lode Runner is composed of several levels presented in a single screen. 
The player character, Jake Peril, has to collect all the treasure (golds with different value) and reach the exit. 
"Mad Monks" are also here to protected treasures by capturing Jake. Those wears red robes.

#### Project Goals
* Validate Object-Oriented Programming skills.
* Use design patterns in the game.
* Make simple, yet effective, artificial intelligences for enemies.
* Make a self-taught game.

{% capture links_include %}
{% include helpers/project-links %}
{% endcapture %}
{{ links_include | markdownify }}

Screenshots
--------------------
{% capture carousel_include %}
{% include helpers/project-carousel %}
{% endcapture %}
{{ carousel_include }}

Detailed Info
--------------------
Lode Runner is a single player game where level can be seen as puzzles. 
We made 4 levels to test and show our game. 
We made sure to insert every items and blocs we developed so far. 
Each level belong to one of the world the player as to go through :
* Jungle World
* Fire World
* Snow World
* Death World

### Game Features
* Player movements (ZQSD)
* Player abilities (break a dirt cube, pick up an object, use an object)
* Custom puzzles floor (wood, stone, glue) to make puzzles harder and fun.
* Weapons (bombs, glue pistols) to slow and escape from enemies or solve puzzles.
* Several AI for enemies.

### Level editor
Like the original game "Lode Runner - The Legend Returns" we decided to create a game editor. 
We did not create a user interface for the editor so regular user will not be able to use it. 
We made this tool for game designer to help them create levels. 
They just have write down where blocs should be and to specify their kind.
