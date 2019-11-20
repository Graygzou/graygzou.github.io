


Screenshots



Detailed Info


What I've done

Player Controller / Animations
I help in the first version of the player controller. 
Moving from a state to another (walking, swimming, sliding), adapt the speed, the animation, etc.
I also made some of the penguin animations since we lack of artists/animators in the team.

Water simulation
At the beginning of the project, we wanted to have our gameplay heavily based on the water of the game.
Indeed, since most of it was supposed to be penguins in the water, pushing ice chunks, swimming and creating waves.

We had many hypothesis from the start. 
We knew we were going to use a mesh and move vertices in order to create the water but it will not be enough to generate waves.
To have random waves we thought about perlin noise. 
It could create the height map that would correspond on the position of each vertex on given time.
At midproject we realize that a technique called that use Fast Fourier Transform could generate an ocean.
But we thought this technique alone will not be enough to deal with waves and water interactions.

We found a paper about IWave algorithm and dig more into it. Paper can be found here.
We also study a physic based buoyancy to match the water perfectly. 
Our sources comes from Gamasutra and can be found here.


Even if we put a lot of works into it, we did not managed to have something efficient and .
We decided to not include it in the final version of the game to avoid to many problems later on.

Adaptative AI
We developed an adaptive AI because it was a constraints.
We decided to make it spawns elements (chunks, killer whales, penguins) depending on the player behavior.

Since the game is multiplayer, we isolate two behaviours:
  Collaborative behavior.
  Competitive behavior.
 
So the AI will study players actions and decisions in order to attribute them a score corresponding to a specific behavior. 
The below chart summarize the meaning of the score each players can get. 
If the score is negative it means he's in a collaborative mindset. If the score is positive then the player is considered as competitive.
!player behavior

This score will change depending on the action on each players. 
For example if the player with the most penguins followers decide to eat a fish his score will increase (competitive). 
But if he decided to give a penguin to the other player than his score will decrease (cooperative).

The most consecutive action in a specific behavior, the more weight will be attribute to the decrease/increase.
I helped implementing this system and also some tools related to it like the spawning grid useful for the AI to spawn objects. 

