---
layout: post
title:  "What I've learned during Advent Of Code 2019 :christmas_tree:"
date:   2019-12-31 08:00:00 -0400
categories: challenges
---

Like last year, I've decided to participate to the Advent Of Code 2019. 
And (like last year..), I also decided to tackle this event with a crazy challenge : Use Unreal Engine 4.

Feel free to check all my solutions for each year in my [Github Repository](https://github.com/Graygzou/advent-of-code-2019).

### Why Unreal 4 ?
As a game programmer, you have to know how game engine works. 
Of course you don't have to know several one. 
As long as you know one of them you should be fine.

I personally find interesting to compare them to know what they do best one compare to the other.
It's also a good skill to have (knowing a few game engine). 
Since Unreal is used by some game development studios, it's always good to add that kind of knowledge in my backpack.

Plus, I bought a couple of courses on that subject a while ago. 
So it was a good opportunity to make a good use of them. :wink:

### Summary of what I've learned
1. **Unreal does not deal with `.txt` by default**   
You have to convert it first into a know format like a `.csv`. 
Then you will have to import it as `.csv` with a custom structure or not 
(depends if the csv is a made for a build-in feature of unreal)
If you do not follow those steps, Unreal will not display text file in the editor.

2. **Code in Visual and launching Unreal to debug** 
I lost a lot of times doing the opposite. All due to crashed. 
I guess if you're the guy that never encountered crashed when coding in C++, then this tips is useless for you.
So when I wrote my solutions in plain C++, I only had Visual Studio opened, and then launched the debugger to test it in unreal.

3. **Read the documentation**   
Sounds a bit cheesy but in this case it helps. 
I mean, when you use any third party software, you need to know how to use it right !
It's the same for Unity, Cry-Engine, JMonkey, etc. Or any framework, libraries you want to use.

4. **Standard Library Class**   
This is the C++ class I've used the most when solving AoC puzzles. 
I find it useful because those correspond to standard C++ file without specific behavior.
I did not dig enough to be familiar with other C++ classes to make good use of them. 
To make a good usage of that class I had to make them all static and `BlueprintCallable` (see next section).   

5. **Actor Class**
In a couple of cases, the Standard Library Class was not enough. 
Because the previous class type can't be use to spawn object, I had to use the `Actor Class` instead. and visualize the result but those were one-off case.

6. **UFUNCTION, UPROPERTY**   
Of course, by using Unreal, I made a little use of some keywords. 
`UNFONCTION` is one of them. This keyword is placed on top of C++ functions. 
It allows to specify special behavior for the described function. 
For example, adding `BlueprintCallable` would make the function available in blueprint.
Same goes with `UPROPERTY` but for properties.

### Favorite puzzles
From all the puzzles I did in the 24 days, I really liked days 2, 6, 10. 
I found them interesting to solve. 
The problem was well explained, the examples were nicely presented and the background story attractive.
I also like them cause I ended-up with clever solutions for most of them. 
Two examples could be :
- Day 2 part 2: I only the good old pencil/paper method to solve it with maths.
- Day 10 part 1: the use of a simple dot product to solve the puzzle quickly.

### Conclusion
Even if I did not finish all the puzzles in the require time, I had a fun doing it.
Compare to last year, I did not tackle with the same spirit and the mind set which might explains a bit my slow progress.

I will try to complete all of them in my spare time when I want to challenge myself !
See you next edition !

#### Links
As always, you can find more on those links if you're interested.
- [My Github Repository](https://github.com/Graygzou/advent-of-code-2019)
- [Advent Of Code official website](https://adventofcode.com/2019/)
- [Unreal official documentation](https://docs.unrealengine.com/en-US/API)
- [Unreal official blog](https://www.unrealengine.com/en-US/blog)
