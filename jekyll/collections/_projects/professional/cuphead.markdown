---
title: Cuphead
description: UI polish and bugs fixes related to the localization of the game
date: 2018-01-01
tags: []
languages:
  - name: C#
    percentage: 90.0
    color: "#178600"
  - name: Others
    percentage: 10.0
    color: "#178600"
tags: ['unity3d', 'UI related to localization', 'UI integration', 'Bugs fixes', 'Tools']
category: 'professional'
pitch: "_Cuphead_ is a 2D Run and gun game published by StudioMDHR in 2017.
         His gameplay is centered around continual boss fights, with interspersed run and gun levels.
         <br/>
         <br/>
         I worked on the major patch of April 2019 which contains, the nintendo switch released, Mugman mode and localization in 11 languages of the game.
         Most of my work where on the UI to fix bugs related to all the new languages in the game."
pinned: true
platforms: Windows, Linux, Mac, Nintendo Switch
engines: Unity3D
tools: [Rewired, TextMeshPro, Git, Steam Upload, Jira, SDEV (Switch), Paint.net, Jenkins]
duration: "6 months"
team-size:
  - role: Programmer
    amount: 3 (2 abroad)
  - role: Producer
    amount: 2 (1 abroad)
remote-team: yes
main-roles: [UI Programmer, Game Programmeur]
project_links:
  - name: steam
    url: "https://store.steampowered.com/app/268910/Cuphead/"
  - name: gog-dot-com
    url: "https://www.gog.com/game/cuphead"
additional-sections:
  - name: tasks
    list: ["Adapt UI and text per language to have",
           "Integrate assets in the game for the specific languages.",
           "Correct bugs like UI animations, controllers, etc."]
  - name: constraints
    list: ["The English version must stay unchanged.",
           "The client must accept all the changes made (via screenshots)."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
I had the chance to work on Cuphead made by the MDHR studio during my internship. At this time, the game was already launched.

My mission was to resolve bugs and also polish with extreme the gameto be ready for his new update. In this update, the team ported the game on nintendo switch but also localized it in eleven additional languages. [All information of this update](http://studiomdhr.com/cuphead-is-coming-to-nintendo-switch-plus-new-free-content-for-everyone/){:target="_blank" rel="noopener noreferrer"} can be found in the link.

The main task I worked on were related to UI in general:

{% include helpers/side-image.md path="/assets/project-images/unleashed/carousel/environment-skull[r500x500].png" basename="environment-skull[r500x500]" css="right-side-img" %}

| UI bugs fixes | UI Integration |
| UI animations bugs fixes | UI features (make the glow of the boss title) |
| controllers bugs | bring legacy branch up-to-date (git) |
| localization bugs |  |

All of the above by keeping an eye on the English version. Which create a lot of "back and forth" from English to other languages. 

### Boss glow for images
This problem arised as soon as some boss titles were not made in TextMeshPro. Boss titles are display just before entering a boss fight. And making them sweet and appealing is a huge deal.

Indeed, japanese, chinese and korean boss titles were images due to the desire to keep hand written style for those.

So the goal here was to fake a glow behind them in some way. The challenge was we did not have artists available to make it.

Luckily we came up with an idea to make it happen. To trick was to create a sprite of the glow "offline" to display it under the boss name. 

{% capture basenames %}environment-skull[r500x500],environment-skull[r500x500],environment-skull[r500x500]{% endcapture %}
{% include helpers/list-image.md path="/assets/project-images/unleashed/carousel/" basenames=basenames extension="png" %}

To summarize it from my memories, to generate it, we used an empty scene, a camera and a render texture. The camera had a bloom script attached to it. The image of the boss title we wanted to create the glow for was display in the right position on screen.

I created a little script that waited 1 frame just after the play mode. The goal was to save what the camera was rendering and save it as an asset. If we waited more than one frame, the Bloom was expanding on the entire screen, which was not what we wanted.

Once the texture was saved, I had to opened it in a image editing tool to only keep the glow alone and make the rest transparent.

We had to make a couple of iterations on the bloom to make sure it was correctly setup for our needs.

By doing it that way, we avoid having to care about performance issue related to trigger a post effect at runtime. Which is always costly. But we had to add a lot of additional sprites in the project 

### What I've done
* Multi purpose script to move UI element based on the language.
* Custom editor to make the usage of this script easily.
* Deploy test build to steam (throught Steamwork) and GOG to test new controllers (Nintendo Switch and Steam controller).
* Communicate with the maximum of people involved to be sure what the game looks like was fine 
(even if most of the time they were checking, at the beginning at least).

#### Be really accurate
{% include helpers/side-image.md path="/assets/project-images/unleashed/carousel/environment-skull[r500x500].png" basename="environment-skull[r500x500]" css="left-side-img" %}

What make the process slow was the number of iterations and back and forth I had to make 

<!--
To give an order of size Cuphead is :
- 81 death quotes
- 
In 11 new languages !-->

Positon well glyphs and make sure hightlighted text is kept between languages.
Cutscenes.
Soul contract, player menu, speech bubbles.
Options
Tutorial options
etc.


Post-Mortem
--------------------
### What helped me a lot
* Cheats in the game (instant win, instant lose, switching between languages, etc.)
* Communicate on bugs I found in the game that were not listed on my side.
* Self organisation (with a bloc note / write (huge) comments on JIRA task)
* TextMeshPro features (font generation parameters, per character spacing (kerning), etc.)
* Work on my own branch and create side branch for bug (which will be rebase when finished)
* Usage of [Wayback Machine](http://web.archive.org/){:target="_blank"  rel="noopener noreferrer"} to find documentation from an older version of a plugin

### What could be better
* A tool that take screenshot automatically of the same configuration in many languages would have been super useful. Because a lot of tasks involved manual QA from me. Which is painful.
* Not use -f (force) when using git command (I guess we all have been there...)