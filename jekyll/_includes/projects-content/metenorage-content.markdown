<!--- Grégoire Boiron <gregoire.boiron@gmail.com> --->
<!--- Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved. --->

Detailed Info
--------------------
{% include helpers/side-image.md path="/assets/project-images/metenorage/carousel/metenorage1[r200x200]" basename="metenorage1[r200x200]" css="right-side-img" %}

The modularity of the architecture helped build the engine : 
we could plugged systems managers, independently, to the existing engine as we went through the project. 
At the end, we took care of essential managers for video games development :

| Camera system | Physics system |
| Rendering system | Sound system |
| Lighting system | Scripting system |

### The Physics System
{% include helpers/side-image.md path="/assets/project-images/metenorage/carousel/metenorage1[r200x200]" basename="metenorage1[r200x200]" css="right-side-img" %}
We mainly used **JBullet** a java port of the [Bullet](https://github.com/bulletphysics/bullet3) library to implements the physics of our engine. 
We can attach a rigidbody to an entity that apply physics on it. 
Parameters like the size of the rigidbody or the mass of the object can be modified to create custom behaviors.

### The Sound System
LWJGL provide the [OpenAL](https://www.openal.org/) library to manage game sounds. 
We decided to use it and make it simple for the user. 
Source component can be attached to entities but each sources can only play one clip (OpenAL let source components managed many clips but we chose to restrict this).

### The Scripting System
We chose to implements a scripting system to allow users to create their game logic without knowing the engine. In addition, we chose to hide the engine methods to keep his integrity of the engine. To call a specific method, the script will go throught his parent class that will add his request to a messaging queue. The engine checks this queue every update to process and empty it.

### The Editor
{% include helpers/side-image.md path="/assets/project-images/metenorage/carousel/editor1[r200x200]" basename="editor1[r200x200]" css="left-side-img" %}

To create games easily, we implemented a game editor. 
This editor let users see his entities and the components attached to each entity. 
The user can edit each component thanks to spinners or others widgets. 
When the user is satisfied of his game, he can save it by clicking on the save button. 
The game will be save in JSON file to be later, load in the Java main.
