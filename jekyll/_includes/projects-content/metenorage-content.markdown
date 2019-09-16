<!---
Grégoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018 Grégoire Boiron  All Rights Reserved.
--->

Overview
--------------------
Metenorage is a Java engine made for a school project at the Université du Québec &#224 Chicoutimi (UQAC). The course is the following : <a href="http://cours.uqac.ca/8INF871">Game Engines Principles (8INF871).

We implements this engine in Java with the framework <a href="https://www.lwjgl.org/">LWJGL</a> (Lightweight Java Game Library). We chose to based our engine on a Entity-Component-System (ECS) architecture because of his modularity and flexibility.

### Project Goals
* Create a game engine which is modular and flexible.
* Enable users to create 2D and 3D games.
* Implements basics systems to create simple games.
* Keep the engine "clean" by splitting it from metadata (scripts and resources).
* Facilitate the creation of games with an editor.

<span class="table_title">Github Link</span>: <a href="https://github.com/Graygzou/Metenorage">METENORAGE Project</a>.

Screenshots
--------------------
In progress.

Detailed Info
--------------------
The modularity of the architecture helped build the engine : we could plugged systems managers, independently, to the existing engine as we went through the project. At the end, we took care of essential managers for video games development :

| Camera system | Physics system |
| Rendering system | Sound system |
| Lighting system | Scripting system |

### The Physics System
We mainly used <a href="http://jbullet.advel.cz/">JBullet</a> library to implements the physics of our engine. We can attach a rigidbody to an entity that apply physics on it. Parameters like the size of the rigidbody or the mass of the object can be modified to create custom behaviors.

### The Sound System
LWJGL provide the <a href="https://www.openal.org/">OpenAL</a> library to manage game sounds. We decided to use it and make it simple for the user. Source component can be attached to entities but each sources can only play one clip (OpenAL let source components managed many clips but we chose to restrict this).


### The Scripting System
We chose to implements a scripting system to allow users to create their game logic without knowing the engine. In addition, we chose to hide the engine methods to "protect his integrity" of the engine. To call a specific method, the script will go throught his parent class that will add his request to a "Messaging queue". The engine checks this queue every update to process and empty it.

### The Editor
To create games easily, we implemented a game editor. This editor let users see his entities and the components attached to each entity. The user can edit each component thanks to spinners or others widgets. When the user is satisfied of his game, he can save it by clicking on the save button. The game will be save in JSON file to be later, load in the Java main.