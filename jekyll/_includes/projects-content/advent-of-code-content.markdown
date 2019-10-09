<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018 Gregoire Boiron  All Rights Reserved.
--->

Overview
--------------------
Advent of Code is an Advent calendar of small programming puzzles for a variety of skill sets and skill levels that can be solved in any programming language we like. 
People use this event as a speed contest, practice problems, or even to challenge each other. It's made by Eric Wastl and 2018 was the 4th edition.

### Project Goals
* Challenge myself.
* Discover the language Lua.
* Share with my friends possible solutions and optimizations.

{% capture links_include %}
{% include helpers/project-links %}
{% endcapture %}
{{ links_include | markdownify }}

Detailed Info
--------------------
I decided to go with Lua which was new to me. 
All my friends choose C# or C++ which were the main languages we work most of the time.

### Motivation behing Lua
The good part was to learn a new language. I've already seen a bit of lua in a previous project (Raven)
but I did not have the chance to really play with it. So I decided it was a good time to do so. 

I also heard some companies were using lua as a scripting language for their game / engine. 
Sp I guess, It's always good to have more than one string to your bow.

### The bad side

1) Lua is great in term of scripting. But not so great to deal with some kind of problems. 
In fact, sometimes puzzles were easy to solve with a bit of abtraction. 
And, it's not something really straight forward in lua.

2) I'd something did "reinvent the wheel". Like sorting an array with a bubble sort. 
Or even apply a function to all element of an array. Those things require extra work compare to a language that already offers helpers functions to do it.

### What I had to do

 - Write a lot of unit test:  
Since I split my work into many function without any classes, I had to make sure every function was doing what is was supposed to do.
To solve that problem I commit myself to write unit tests and make sure it pass before submitting something. 
Because, if you didn't know, the more you submit to a challenge, the longer you will wait before being able to submit another answer.

 - Add Comments everywhere:  
I'm a person that love comments. I find myself writing some in order to organize my thinking when I do something. 
But in that case, it helps me even more with all the boiler plate code I needed to write.

 - Keep thinking of other possible solutions:  
Some problems were thouther than others. But some were computionally expensive. 
Meaning I had to rethink about my solution in order to be able to find the right solution. 
Also, some could contains patterns that could possibly avoid having to refactor and just find the solution right away (with a little bit of calculus for example)
 
### Conclusion
I find myself not finished the AoC 2018. 
Even if I see it as a bit of a failure, I've learned a lot and challenge myself once again.
I keep some good memories from this experience and will do the next edition for sure.
