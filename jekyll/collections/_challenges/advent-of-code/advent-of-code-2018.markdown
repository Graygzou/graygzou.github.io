---
name: "4th Edition"
highlights: [Learn Lua]
start-dates: [2018]
localisation: At Home
category: aoc
display: true
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2021 Gregoire Boiron  All Rights Reserved.
--->

### Using Lua
You might ask yourself: why so much pain ?  
Well, the answer is simple: I wanted learn something new and why not useful in the video game industry too.
The point of my participation was not to solve fast puzzles but more like finding "beautiful algorithms" to solve them.

I've already seen a bit of lua in a previous project (Raven) but I did not have the chance to really play with it. 
So I decided it was a good time to do so !

I also heard some companies were using lua as a scripting language for their game / engine. 
So I guess, It's always good to have more than one string to your bow.

### The drawbacks
1) Lua is great in term of scripting. But not so great to deal with some kind of problems. 
In fact, sometimes puzzles were easy to solve with a bit of abtraction. 
And, it's not something really straight forward in lua.

2) I've sometimes "re-invented the wheel". 
Like coding sorting an array with a bubble sort which is a basic compute science exercise and is part of most array/vector libraries (contains at least a `sort()` method). 
Or even apply a function to all element of an array. Those things require extra work compare to a language that already offers helpers functions to do it.

<!-- Include "it's a trap" image -->

### Overcome Lua weaknesses
 - Write a lot of unit test:  
Since I split my work into many function without any classes, I had to make sure every function was doing what is was supposed to do.
To solve that problem I commit myself to write unit tests and make sure it pass before submitting something. 
Because, if you didn't know, the more you submit to a challenge, the longer you will wait before being able to submit another answer.

 - Add Comments everywhere:  
I'm a person that love comments. I find myself writing some in order to organize my thinking when I do something. 
But in that case, it helps me even more with all the boiler plate code I needed to write.

- Don't hesitate to create a `Utils` functions:   
I found myself writing some generic functions into `Utils` file because it was useful in more than one challenge.
I would not spent minutes / hours have to rewrite and test it again.

 - Keep thinking of other possible solutions:  
Some problems were thouther than others. But some were computionally expensive. 
Meaning I had to rethink about my solution in order to be able to find the right solution. 
Also, some could contains patterns that could possibly avoid having to refactor and just find the solution right away (with a little bit of calculus for example)