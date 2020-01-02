---
layout: post
title:  "Summary of my first participation of Advent Of Code"
date:   2019-10-09 20:00:00 -0400
categories: challenges
---

Little blog post (almost a year after my participation..) about my first participation to this event.

Backstory
--------------------
A collegue told me about this event and the blast he had when doing it with others co-workers.
Just by hearing the evelator pitch I was sold right away. (challenges, puzzles, computer science :heart:)

I was crazy enought to decided to do it in Lua. 
Compare to all my co-workers (4 of them) that choose C# or C++ which were the main languages we work most of the time.

Feel free to check all my solutions for each year in my [Github Repository].

#### Why Lua ?
You might ask yourself why so much pain ?  
Well, the answer is simple: I wanted learn something new. 
The point of my participation was not to solve fast puzzles but more like finding "beautiful algorithms" to solve them.

I've already seen a bit of lua in a previous project (Raven) but I did not have the chance to really play with it. 
So I decided it was a good time to do so !

I also heard some companies were using lua as a scripting language for their game / engine. 
Sp I guess, It's always good to have more than one string to your bow.

#### The counter part
1) Lua is great in term of scripting. But not so great to deal with some kind of problems. 
In fact, sometimes puzzles were easy to solve with a bit of abtraction. 
And, it's not something really straight forward in lua.

2) I've sometimes "re-invented the wheel". 
Like coding sorting an array with a bubble sort which is a basic compute science exercise and is part of most array/vector libraries (contains at least a `sort()` method). 
Or even apply a function to all element of an array. Those things require extra work compare to a language that already offers helpers functions to do it.

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

### Favorite puzzles
In progress.

### Conclusion
I find myself not finished the AoC 2018. 
Even if I see it as a bit of a failure, I've learned a lot and challenge myself once again.
I keep some good memories from this experience and will do the next edition for sure.

#### Links
[Github Repository](https://github.com/Graygzou/advent-of-code-2018)
[advent of code](https://adventofcode.com/2018/)
[lua documentation](https://www.lua.org/pil/contents.html)
