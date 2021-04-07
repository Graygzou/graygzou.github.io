---
name: "6th Edition"
highlights: [Finished it]
start-dates: [2020]
localisation: At Home
category: aoc
display: true
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2021 Gregoire Boiron  All Rights Reserved.
--->

## 2018 Edition
#### Why Lua ?
You might ask yourself why so much pain ?  
Well, the answer is simple: I wanted learn something new. 
The point of my participation was not to solve fast puzzles but more like finding "beautiful algorithms" to solve them.

I've already seen a bit of lua in a previous project (Raven) but I did not have the chance to really play with it. 
So I decided it was a good time to do so !

I also heard some companies were using lua as a scripting language for their game / engine. 
Sp I guess, It's always good to have more than one string to your bow.

#### The drawbacks
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

## 2019 Edition
#### Let's go big
For this year, I decided to try solving puzzle in Unreal Engine.
It will allows me to write custom C++ code in this engine, by creating node, and then use it to solve puzzle in blueprints.

Plus, I was hoping to have enough time to allow binding asset directly on the code, to visualize the puzzle solving process. Making it visually happeling.

#### 


## 2020 Edition
#### Finish it
After two unfinished editions, I wanted this time to at least complete all the puzzles.
To be able to do that, I decided to stick with something simple : do them in plain C++. Without fancing tools or engines this time.

As always, my goal was not to finish it fast, but making sure my solutions are readable, efficient and simple.

#### Favorite puzzles
I might forgot some but here are some:

- [RainRisk](https://adventofcode.com/2020/day/12): This puzzle was funny because you could solved part 2 quickly if your part 1 was using a generic algorithm. In this case, using a rotation matrix right away to make the boat rotate will allow to keep the same logic and adapt it a bit (like adding `round()`) to have both solutions.

- [Shuttle Search](https://adventofcode.com/2020/day/13): I really like the puzzle 13 part 2 because I knew right away a mathematical solution would solve it elegantly: all bus ids were primes and we could express the problem by a equation system using the modulo for each equations.
After research, I finnaly found out about [Chinese remainder theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem) which was exatcly what I was looking for. This method take advantage of Bézout's identity and the extended Euclidean algorithm to find the solution.

- [MonsterMessages](https://adventofcode.com/2020/day/19): The tricky point in part 2 about this one was the possible loops introduced in the input modification. This gotcha was not present in part 1.
Since my part 1 solution was to convert rules into regexp and simply run every message against the first regexp, I was a bit stuck with loops.
What I did to still use my initial soluion was to modify a bit by hand the input to include regex that still express loops but avoid my algorithm to create some.
I know the limitation of this method and the potential harm it can cause if my `WARNING` comment is ignored. But I was pretty happy to reuse my part 1 without extra headaches. 

#### Bonus: Github actions
I reached my goals and finished all of them a little bit after christmas.
Having done that, I took some extra times to setup two GitHub actions workflows to do the following:

1. The first one was used to build the project and create a `.zip` of it containing an `.exe` for each solutions. This `.zip` is then published to the as a Release in GitHub directly. Go checkout [the Release v1.0](https://github.com/Graygzou/advent-of-code-2020/releases/tag/v1.0) now if you wish to. 

2. The second workflow was made to make sure each of my solutions were finals, that the code was working correctly and retrieve basic metrics on each puzzles to be later displayed in the project `README.md` thanks to the [image-chart.com API](https://www.image-charts.com/). 

<!-- Include workflow image -->
<!-- Include chart image -->

This later workflow will be more useful that the first one since it allow to have a quick overview on possible solutions weaknesses and strength.

Right now it only display execution times in ms. The time isn't accurate either (rounded to the closest seconds). But improving it might come when I will re-use it for other challenges! :) 