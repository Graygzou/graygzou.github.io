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
| ![Jumping action](/assets/project-images/native-ruins/Puzzle-icons/jump2.png) Jumping actions | ![Running action](/assets/project-images/native-ruins/Puzzle-icons/run2.png) Running actions  | ![Bear totem](/assets/project-images/native-ruins/Puzzle-icons/totem.png) Bear Totem      |
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

The second puzzle requires all the spirit totems : 
the bear totem and the wolf totem. 
That's why, it's the last puzzle in the game.

{% capture image_path %}/assets/project-images/native-ruins/enigme4noted.png{% endcapture %}
{% capture image_path_webp %}/assets/webp/enigme4noted.webp{% endcapture %}
{% include images-handler.html alt="puzzle 4" filename=image_path webp=image_path_webp %}
{: .puzzle-img}

|-------------------|------------------------------|-----------------|---------------|
| ![Jumping action](/assets/project-images/native-ruins/Puzzle-icons/jump2.png) Jumping actions | ![Running action](/assets/project-images/native-ruins/Puzzle-icons/run2.png) Running actions  | ![Transformation switch](/assets/project-images/native-ruins/Puzzle-icons/TS.png) Transformation Switch | ![Rope](/assets/project-images/native-ruins/Puzzle-icons/rope.png) Rope |
{: .puzzle-caption}

| *Puzzle solution*                                                             |
|-------------------------------------------------------------------------------|
| 1. Jump on the tree and go at the end.                                        |
| 2. Lift the tree by using the bear transformation.                            |
| 3. Use the Puma transformation to run and jump on the rock.                   |
| 4. Quickly run since the tree will go back to his initial position            |
| 5. When reaching the end of the tree jump to climb on the rock.               |
| 6. Press E to obtain the rope.                                                |
{: .puzzle-solutions}

#### Mirror puzzle
This puzzle is inspired from [Prince Of Persia](https://fr.wikipedia.org/wiki/Prince_of_Persia): 
the player has project a laser coming from a point A to another point B to lift a fence. 
He can move mirrors along the room to allow the laser beam in the right direction. 
To not frustrated user with this puzzle, we decided to restrict to the maximum mirrors movements.

We also added the following constraint : 
mirrors can only be moved in bear form. 
This helps keep the puzzles order we decided.

{% capture image_path %}/assets/project-images/native-ruins/enigme2noted.png{% endcapture %}
{% capture image_path_webp %}/assets/webp/enigme2noted.webp{% endcapture %}
{% include images-handler.html alt="puzzle 2" filename=image_path webp=image_path_webp %}
{: .puzzle-img}

|-------------------|------------------------------|-----------------|---------------|
| ![Laser beam](/assets/project-images/native-ruins/Puzzle-icons/laser.png) Laser beam | ![Bear statue initial position](/assets/project-images/native-ruins/Puzzle-icons/bear1.png) Moving bears initial positions  | ![Bear statue final position](/assets/project-images/native-ruins/Puzzle-icons/bear2.png) Right position | ![Sail](/assets/project-images/native-ruins/Puzzle-icons/sail.png) Sail |
{: .puzzle-caption}

| *Puzzle solution*                                                                 |
|-----------------------------------------------------------------------------------|
| 1. Transform in Bear form.                                                        |
| 2. Push the closest bear in front of the beam.                                    |
| 3. Push the second bear to hit the further mirror on the other side of the room.  |
| 4. Quickly run since the tree will go back to his initial position                |
| 5. Push the last moving bear on the right to meet the beam.                       |
| 6. Once the gate's open, Press E near the sail to pick it up.                     |
{: .puzzle-solutions}

#### Action puzzle
Finally, we created an action puzzle where the player has to destroy rocks with his bear transformation. 
This puzzle is simple but it's the player's job to find out by himself the correct way.

{% capture image_path %}/assets/project-images/native-ruins/enigme3noted.png{% endcapture %}
{% capture image_path_webp %}/assets/webp/enigme3noted.webp{% endcapture %}
{% include images-handler.html alt="puzzle 3" filename=image_path webp=image_path_webp %}
{: .puzzle-img}

|-------------------|--------------------------------------------------------------|
| ![breakable rocks](/assets/project-images/native-ruins/Puzzle-icons/circle.png) imaged Breakable rocks | ![Wolf totem](/assets/project-images/native-ruins/Puzzle-icons/totem.png) Wolf Totem  |
{: .puzzle-caption}

| *Puzzle solution*                                                                 |
|-----------------------------------------------------------------------------------|
| 1. Transform in Bear form.                                                        |
| 2. Run into rocks in front of the gates to break                                  |
| 3. Keep going until you have a path large enough to go through.                   |
| 4. Once you clean up all the rocks in front of you, walk to the totem.            |
| 5. Press E to pick up the wolf totem.                                             |
{: .puzzle-solutions}

### Dialogues & Cut-scenes
Finally, we decided to creates in-game cut-scenes to have a better user-experience. 
We made a complex first cut-scene with player animations, dialogues and the game's credits.

To make it, we implemented managers, that contains data structures, which take care of animations transitions or dialogues order. 
Others animations and dialogues are available when Judy discovers new items or when hints are needed.
