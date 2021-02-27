<!--- Grégoire Boiron <gregoire.boiron@gmail.com> --->
<!--- Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved. --->

Game Design Document
--------------------
For more details about the game and the core mechanics, take a look at the Game Design Document. Some details were modified due to deadlines. This document contains 8 sections which are the following :

|Sections                                                          ||
|-----------------------------|-------------------------------------|
|1. Overview                  | 5. User Interface (UI)              |
|2. Background and characters | 6. Artificial Intelligence (AI)     |
|3. Gameplay and mechanics    | 7. Technicals details               |
|4. Levels                    | 8. User stories and planification   |

Click here to take a look at the GDD : [Game Design Document - Native Ruins](/assets/Game Design Document - Native Ruins.pdf).

Screenshots
--------------------
{% include helpers/project-carousel %}

Detailed Info
--------------------
Native Ruins is survival, open world game. 
The player can have fun discovering the island and also by solving puzzles. 
It takes around 30 minutes to finish the game if the player doesn't get too lost in the island.

### Scripting (C#)
Here a list of main features we implements in this video game :

| Features                                                         ||
|-----------------------------|-------------------------------------|
| Player movements (ZQSD movement in the camera's direction)    | Bow mechanics (aim toward mouse cursor with body rotation) |
| Third person Camera (independent from the player)             | Player animations |
|Animals artificial intelligence (movement and behavior)        | Mirror's reflection script (Second Enigme with laser) |
| Fighting system (losing health and apply damages)             | Physics system bag (dropping objects and interact with them) |

### IA techniques
#### Steering Behavior
To make animals move, we decided to implements a steering behavior scripts based on vector forces. 
By doing that, we did not used the navigation mesh (NavMesh) already implemented in Unity. 
The class diagramme is available on the same section. 
By doing that, we let the possibility to improve animals movements way easier like squirrels going up on trees. 
This movement will not be simple to make only with Unity's NavMesh.

#### Finite State Machine (FSM)
We also decided to implements a Finite State Machine to describe animals behaviors. 
This allow to make human like behaviors and make it more realistic.

The agent delegate behavior transitions to the StateMachine class that take care of calling exit(), enter() and execute() functions.

We decided to code it from scratch and did not used Animation State Machines which could be useful in our case. But we had more controls by doing it that way.

In addition, as we can see in the class diagram, additional states can be added easily to the pattern and update agent behavior. 
The only requirement is the relationship with the State<T> class (extends).

### Puzzles
#### Jumping puzzle
Our game contains two jumping puzzles.

The first one can be accomplished at the beginning of the game when the player hasn't got any additional abilities yet. 
Those will be later add, thanks to spirit totems.

Enigme 1 - First jumping puzzle
{: .puzzle-subtitles}

{% capture image_path %}/assets/project-images/native-ruins/enigme1noted.png{% endcapture %}
{% capture image_path_webp %}/assets/webp/enigme1noted.webp{% endcapture %}
{% include images-handler.html alt="puzzle 1" filename=image_path webp=image_path_webp %}
{: .puzzle-img}

|-------------------|------------------------------|--------------------------------|
| ![](/assets/project-images/native-ruins/Puzzle-icons/jump2.png) Jumping actions | ![](/assets/project-images/native-ruins/Puzzle-icons/run2.png) Running actions  | ![](/assets/project-images/native-ruins/Puzzle-icons/totem.png) Bear Totem      |
{: .puzzle-caption}

| *Puzzle solution*                                                             |
|-------------------------------------------------------------------------------|
| 1. Climb on the tree.                                                            |
| 2. Jump four times on the closer rock.                                           |
| 3. Climb the second log of wood.                                                 |
| 4. Make two running jumps to continue.                                           |
| 5. Fall on the inclined rocks and jump at the right moment to land on the rock.  |
| 6. Jump on the next rock and finish by a running jump.                           |
| 7. Press E to obtain the bear totem.                                             |
{: .puzzle-solutions}

Enigme 4 - Second jumping puzzle
{: .puzzle-subtitles}

{% capture image_path %}/assets/project-images/native-ruins/enigme4noted.png{% endcapture %}
{% capture image_path_webp %}/assets/webp/enigme4noted.webp{% endcapture %}
{% include images-handler.html alt="puzzle 4" filename=image_path webp=image_path_webp %}
{: .puzzle-img}

The second puzzle requires all the spirit totems : 
the bear totem and the wolf totem. 
That's why, it's the last puzzle in the game.

<div class="puzzle">
  
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 4 - Second jumping puzzle</span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/jump2.png" alt="jump icon">Jumping actions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/run2.png" alt="run icon">Running actions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/TS.png" alt="transformation switch">Transformation Switch</td> </tr>
	    <tr> <td class="bloc"> <img src="/assets/project-images/native-ruins/Puzzle-icons/rope.png" alt="rope icon"> Rope</td> </tr>
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
This puzzle is inspired from Prince Of Persia : 
the player has project a laser coming from a point A to another point B to lift a fence. 
He can move mirrors along the room to allow the laser beam in the right direction. 
To not frustrated user with this puzzle, we decided to restrict to the maximum mirrors movements.

We also added the following constraint : 
mirrors can only be moved in bear form. 
This helps keep the puzzles order we decided.

<div class="puzzle">
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 2 - Mirror puzzle</span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/laser.png" alt="laser icon">Laser beam</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/bear1.png" alt="initial bear pos icon">Moving bears initial positions</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/bear2.png" alt="final bear pos icon">Right position</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/sail.png" alt="sail icon">Sail</td> </tr>
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
  {% capture image_path %}/assets/project-images/native-ruins/enigme2noted.png{% endcapture %}
  {% capture image_path_webp %}/assets/webp/enigme2noted.webp{% endcapture %}
  {% include images-handler.html alt="puzzle 2" filename=image_path webp=image_path_webp %}
</div>

#### Action puzzle
Finally, we created an action puzzle where the player has to destroy rocks with his bear transformation. 
This puzzle is simple but it's the player's job to find out by himself the correct way.

<div class="puzzle">
  {% capture image_path %}/assets/project-images/native-ruins/enigme3noted.png{% endcapture %}
  {% capture image_path_webp %}/assets/webp/enigme3noted.webp{% endcapture %}
  {% include images-handler.html alt="puzzle 3" filename=image_path webp=image_path_webp %}
  <div>
    <h4>Native Ruins</h4>
    <span class="puzzle-subtitles">Enigme 3 - </span>
    <table>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/circle.png" alt="circle">imaged Breakable rocks</td> </tr>
	    <tr> <td class="bloc"><img src="/assets/project-images/native-ruins/Puzzle-icons/totem.png" alt="totem icon">Wolf Totem</td> </tr>
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

### Dialogues & Cut-scenes
Finally, we decided to creates in-game cut-scenes to have a better user-experience. 
We made a complex first cut-scene with player animations, dialogues and the game's credits.

To make it, we implemented managers, that contains data structures, which take care of animations transitions or dialogues order. 
Others animations and dialogues are available when Judy discovers new items or when hints are needed.
