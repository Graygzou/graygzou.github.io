---
title: Memory-lost-in-the-(Red)-W(h)ood(y)
description: Point and click game made in 48 hours for the Global Game Jam 2021
date: 2021-01-30
color: "#178600"
language: C#
languages:
    - name: C#
      percentage: 90.0
      color: green
    - name: ShaderLab
      percentage: 8.1
      color: yellow
    - name: HLSL
      percentage: 1.4
      color: gray
tags: ['unity3d', 'gamejam', 'point-and-click', 'solo-dev']
category: 'jam'
pitch: "_Memory-lost-in-the-(Red)-W(h)ood(y)_ is a Point and click game. 
        This application has been completed for the Global Game Jam 2021 organized in January.
        This edition was the first one fully remote due to covid-19.
        The official website of this event is the following: [Global Game Jam](https://globalgamejam.org/){:target='_blank' rel='noopener noreferrer'}.
        <br/>
        <br/>
        Observe, Think and interact with your mouse to solve this beautiful and relaxing game.
        <br/>
        <br/>
        The game is available both for Windows client and also WebGL meaning you don't need to download anything. 
        All you have to do is to open the game page and you start playing our game !
        <br/>
        <br/>
        The team members didn't know each other and gather in 48h to make that game."
pinned: true
platforms: "Windows, WebGL"
engines: Unity3D
tools: []
duration: "48 hours"
team-size:
  - role: Programmers
    amount: 1
  - rol: 2D Artist
    amount: 1
  - role: Game-Designer
    amount: 1
  - role: Sound designer
    amount: 1
  - role: Narrative designer
    amount: 1
main-roles: [3Cs Programmer, Gameplay Programmer, Project manager]
project_links:
  - name: itch-dot-io
    url: https://graygzou.itch.io/memory-lost-in-the-red-whoody
additional-sections:
  - name: goals
    list: ["Challenge myself",
           "Participate to my third GameJam",
           "Collaborate with people on a short time",
           "Organised work and involve as much as possible people on the jam",
           "Work on my weaknesses (work fast and be result oriented).",]
---

<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2021 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
{% include helpers/side-image.md path="/assets/project-images/memory-lost-in-the-red-whoody/carousel/memory-start-menu[r500x500].png" basename="memory-start-menu[r500x500]" css="right-side-img" %}

This game jam was my 4th game jam and the first one not knowing my team before the event.

We decided to go for something as simple as possible to avoid getting lost on complicated things since we couldn't help each other on technical stuffs.
That's why we went for a point and click.

One of the member of the team came up with [TOHU](https://www.youtube.com/watch?v=EkzFwtn9Hpg){:target='_blank' rel='noopener noreferrer'} as an example. It help us see what we wanted to achieve as gameplay but also a bit as a visual idae of what the game could look like.

Tech side
--------------------
I decided to code every system we wanted in the game (details below) and stick those simple version yet highly customizable throught Unity editor.
I'm pretty proud of that and was happy to being able to setup many object with editor instead of having to do them one at the time.

### Interactables
{% include helpers/side-image.md path="/assets/project-images/memory-lost-in-the-red-whoody/carousel/memory-in-game[r500x500].png" basename="memory-in-game[r500x500]" css="left-side-img" %}

The heart of a point and click is the item you can interact with and use to different purpose.
By realising that right away, I knew I had to do something generic so a lot of works could be done in the editor. 
Doing it that way garantie to re-use existing fonctinnality without adding more code and bugs. 
Of course, some item have special behavior, but as soon as I added the feature, another could use it right away and combining it with existing behaviour for example.

The only downside of it was that, every time the limitation was reached, the codebase of this class was starting to get heavier.
I could split those down by the effort was too time consuming for a jam. 

TODO SCREENSHOT OF EDITOR TOOLS

### Player movement
Point and click games usually include basic character movement. If you click on the ground, the player will move there. That's what we did, with a first iteration making the player move left and right. Sadly, I did not have time to come back on this in order to introduce a more "bouncy", living movements to the character. Plus, a possible improvement would be to adapt the height of the player based on ground variations.

### Inventory system
I made a simple inventory system which allow to store interactable objects. When interacting with an object, the system knows it can be added to the inventory based on the object type. Later we can drag and drop this item onto another game element to create special behavior.

### Dialogue system
{% include helpers/side-image.md path="/assets/project-images/memory-lost-in-the-red-whoody/carousel/memory-grandma-dialogue[r500x500].png" basename="memory-grandma-dialogue[r500x500]" css="left-side-img" %}

Point and click are also famous to tell stories. It's really common to have a global mystery to solve or a quest to accomplished.

I did something really simple, based on scriptable object.

I once again, allow to make it data driven by reading as much data as possible in the scriptable object like the position of the asset when triggering the dialogue
or option to allow overriding the asset by another one if needed.

### Asset integration
I helped my teammates to integrate assets or even sounds into the game to have their work shine and make it pretty. 

### What we had to give up on
- We wanted to create many different "scenes" were the player could go back on forth to solve more advanced puzzles. Transitions will be enable with a direction arrow on the each side of the theater. 
- We wanted to create more puzzles with different "interactions" (clicking on a windows will make an clue drop from it, etc.).
- Create multiple choice dialogues where the player will be able to choose from possible answers. This will allows alternative ends for example. 

Post-Mortem
--------------------
{% include helpers/side-image.md path="/assets/project-images/memory-lost-in-the-red-whoody/carousel/memory-credits[r500x500].png" basename="memory-credits[r500x500]" css="right-side-img" %}

### What helped me a lot
* Think of simple architecture design, yet effective.
* Heavy use of Singletons (yes, I know it's bad..)
* Try to showcase my work to my colleagues with early prototype of features.
* Communication. Ask each member his goal for the jam and his global availabilities.
* Usage of some brainstorm techniques.

### What could I do better
* Try to study ideas without going too deeply to not waste times.
* Work assignments (the possibility to work in the engine or not for example).
* Keep more times for polish (the player character was not as appealing as it should be).
