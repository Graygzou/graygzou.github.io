<!---
Grégoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018 Grégoire Boiron  All Rights Reserved.
--->

Overview
--------------------
Native Ruins is a 3D survival game made for a school project at the Université du Québec à Chicoutimi (UQAC). 
The course is the following : [Design Principles and Video Games Development (8INF955)](https://cours.uqac.ca/8INF955).

You play as Judy, a young 23 years old woman, who wake up on a desert island. Her goal is simple : escape the island. 
To done it, she will need wood, rope and a sail to build a raft. As she goes throught her adventure, she will discover totems that will give her more habilities usefull for archive her goal.

#### Project Goals
* Apply basics principles of game development with tools used in industry.
* earn video games development cycle and basics analystics documents.
* Apply game design practices, game balancing, etc.
* Apply SCRUM method to provide quick and regular feedbacks.

{% capture links_include %}
{% include helpers/project-links %}
{% endcapture %}
{{ links_include | markdownify }}

Game Design Document
--------------------
For more details about the game and the core mechanics, take a look at the Game Design Document. Some details were modified due to deadlines. This document contains 8 sections which are the following :
<table>
  <tr>
    <td>
		<ul>
            <li>Overview</li>
            <li>Background and characters</li>
            <li>Gameplay and mechanics</li>
            <li>Levels</li>
	    </ul>
    </td>
    <td>
	    <ul>
		    <li>User Interface (UI)</li>
		    <li>Artificial Intelligence (AI)</li>
		    <li>Technicals details</li>
		    <li>User stories and planification</li>
	    </ul>
    </td>
  </tr>
</table>
Click here to take a look at the GDD : <a href="Game Design Document - Native Ruins.pdf"><span class="fa fa-file-pdf-o"></span> Game Design Document - Native Ruins</a>.

Screenshots
--------------------
{% include helpers/project-carousel %}

Detailed Info
--------------------
Native Ruins is survival, open world game. The player can have fun discovering the island and also by solving puzzles. It takes around 30 minutes to finish the game if the player doesn't get too lost in the island.

### Scripting (C#)
Here a list of main features we implements in this video game :
<table>
  <tr>
    <td>
	    <ul>
            <li>Player movements (ZQSD movement in the camera's direction)</li>
            <li>Third person Camera (independent from the player)</li>
            <li>Animals artificial intelligence (movement and behavior)</li>
            <li>Fighting system (losing health and apply damages)</li>
	    </ul>
    </td>
    <td>
	    <ul>
		    <li>Bow mechanics (aim toward mouse cursor with body rotation)</li>
		    <li>Player animations</li>
		    <li>Mirror's reflection script (Second Enigme with laser)</li>
		    <li>Physics system bag (dropping objects and interact with them)</li>
	    </ul>
    </td>
  </tr>
</table>

### IA techniques
#### Steering Behavior
To make animals move, we decided to implements a steering behavior scripts based on vector forces. By doing that, we did not used the navigation mesh (NavMesh) already implemented in Unity. The class diagramme is available on the same section. By doing that, we let the possibility to improve animals movements way easier like squirrels going up on trees. This movement will not be simple to make only with Unity's NavMesh.

#### Finite State Machine (FSM)
We also decided to implements a Finite State Machine to describe animals behaviors. This allow to make human like behaviors and make it more realistic.

The agent delegate behavior transitions to the StateMachine class that take care of calling exit(), enter() and execute() functions.

We decided to code it from scratch and did not used Animation State Machines which could be useful in our case. But we had more controls by doing it that way.

In addition, as we can see in the class diagram, additionals states can be added easily to the pattern and update agent behavior. The only requirement is the relationship with the State<T> class (extends).

### Puzzles
#### Jumping puzzle
Our game contains two jumping puzzles.

The first one can be accomplished at the beginning of the game when the player hasn't got any additionals habilities yet. Those will be later add, thanks to spirit totems.

<div class="puzzle">
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 1 - First jumping puzzle</span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/jump2.png"> Jumping actions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/run2.png">Running actions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/totem.png">Bear Totem</td> </tr>

    </table>
    <span class="puzzle-subtitles">Puzzle solution :</span>
    <ol>
	    <li>Clim on the tree.</li>
	    <li>Jump four times on the closer rocks.</li>
	    <li>Climb the second log of wood.</li>
	    <li>Make two running jumps to continue.</li>
	    <li>Fall on the inclined rocks and jump at the right moment to land on the rock.</li>
	    <li>Jump on the next rock and finish by a running jump.</li>
	    <li>Press E to obtain the bear totem.</li>
    </ol>
  </div>
  <img src="/assets/project-images/native-ruins/enigme1noted.png">
</div>

The second puzzle requires all the spirit totems : the bear totem and the wolf totem. That's why, it's the last puzzle in the game.

<div class="puzzle">
  <img src="/assets/project-images/native-ruins/enigme4noted.png">
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 4 - Second jumping puzzle</span>
    <table>
	    <tr>
		    <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/jump2.png">Jumping actions</td>
	    </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/run2.png">Running actions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/TS.png">Transformation Switch</td> </tr>
	    <tr> <td class="bloc"> <img src="/assets/project-images/native-ruins/Puzzle-icons/rope.png"> Rope</td> </tr>
    </table>
    <span class="puzzle-subtitles">Puzzle solution :</span>
    <ol>
	    <li>Jump on the tree and go at the end.</li>
	    <li>lift the tree by using the bear transformation.</li>
	    <li>Use the Puma transformation to run and jump on the rock.</li>
	    <li>Press E to obtain the rope.</li>
    </ol>
  </div>   
</div>

#### Mirror puzzle
This puzzle is inspired from Prince Of Persia : the player has project a laser coming from a point A to another point B to lift a fence. He can move mirrors along the room to allow the laser beam in the right direction. To not frustrated user with this puzzle, we decided to restrict to the maximum mirrors movements.

We also added the following constraint : mirrors can only be moved in bear form. This helps keep the puzzles order we decided.

<div class="puzzle">
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 2 - Mirror puzzle</span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/laser.png">Laser beam</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/bear1.png">Moving bears initial positions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/bear2.png">Right position</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/sail.png">Sail</td> </tr>
    </table>
    <span class="puzzle-subtitles">Puzzle solution :</span>
    <ol>
	    <li>Transform in Bear form.</li>
	    <li>Push the closest bear in front of the beam.</li>
	    <li>Push the second bear to hit the further mirror on the other side of the room.</li>
	    <li>Push the last moving bear on the right to meet the beam.</li>
	    <li>Once the gate's open, Press E near the sail to pick it up.</li>
    </ol>
  </div>
  <img src="/assets/project-images/native-ruins/enigme2noted.png">
</div>

#### Action puzzle
Finally, we created an action puzzle where the player has to destroy rocks with his bear transformation. This puzzle is simple but it's the player's job to find out by himself the correct way.

<div class="puzzle">
  <img src="/assets/project-images/native-ruins/enigme3noted.png">
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 3 - </span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/circle.png">imaged Breakable rocks</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/totem.png">Wolf Totem</td> </tr>
    </table>
    <span class="puzzle-subtitles">Puzzle solution :</span>
    <ol>
	    <li>Transform in Bear form.</li>
	    <li>Run into rocks to break them one after the other</li>
	    <li>Once the front rocks are break, walk to the totem.</li>
	    <li>Press E to pick up the wolf totem.</li>
    </ol>
  </div>   
</div>

### Dialogues & Cutscenes
Finally, we decided to creates in-game cutscenes to have a better user-experience. 
We made a complex first cut-scene with player animations, dialogues and the game's credits.

To make it, we implemented managers, that contains data structures, which take care of animations transitions or dialogues order. 
Others animations and dialogues are available when Judy discovers new items or when hints are needed.
