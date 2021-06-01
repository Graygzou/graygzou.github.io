---
name: "6th Edition"
highlights: [Completed all puzzles]
start-dates: [2020]
localisation: At Home
category: aoc
display: true
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2021 Gregoire Boiron  All Rights Reserved.
--->

## Finish it
After two unfinished editions, I wanted this time to at least complete all the puzzles.
To be able to do that, I decided to stick with something simple : do them in plain C++. Without fancing tools or engines this time.

As always, my goal was not to finish it fast, but making sure my solutions are readable, efficient and simple.

## Favorite puzzles
I might forgot some but here are some:

- [RainRisk](https://adventofcode.com/2020/day/12): This puzzle was funny because you could solved part 2 quickly if your part 1 was using a generic algorithm. In this case, using a rotation matrix right away to make the boat rotate will allow to keep the same logic and adapt it a bit (like adding `round()`) to have both solutions.

- [Shuttle Search](https://adventofcode.com/2020/day/13): I really like the puzzle 13 part 2 because I knew right away a mathematical solution would solve it elegantly: all bus ids were primes and we could express the problem by a equation system using the modulo for each equations.
After research, I finnaly found out about [Chinese remainder theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem) which was exatcly what I was looking for. This method take advantage of Bézout's identity and the extended Euclidean algorithm to find the solution.

- [MonsterMessages](https://adventofcode.com/2020/day/19): The tricky point in part 2 about this one was the possible loops introduced in the input modification. This gotcha was not present in part 1.
Since my part 1 solution was to convert rules into regexp and simply run every message against the first regexp, I was a bit stuck with loops.
What I did to still use my initial soluion was to modify a bit by hand the input to include regex that still express loops but avoid my algorithm to create some.
I know the limitation of this method and the potential harm it can cause if my `WARNING` comment is ignored. But I was pretty happy to reuse my part 1 without extra headaches. 

## Bonus: Github actions
I reached my goals and finished all of them a little bit after christmas.
Having done that, I took some extra times to setup two GitHub actions workflows to do the following:

1. The first one was used to build the project and create a `.zip` of it containing an `.exe` for each solutions. This `.zip` is then published to the as a Release in GitHub directly. Go checkout [the Release v1.0](https://github.com/Graygzou/advent-of-code-2020/releases/tag/v1.0) now if you wish to. 

2. The second workflow was made to make sure each of my solutions were finals, that the code was working correctly and retrieve basic metrics on each puzzles to be later displayed in the project `README.md` thanks to the [image-chart.com API](https://www.image-charts.com/). 

<!-- Include workflow image -->
<!-- Include chart image -->

This later workflow will be more useful that the first one since it allow to have a quick overview on possible solutions weaknesses and strength.

Right now it only display execution times in ms. The time isn't accurate either (rounded to the closest seconds). But improving it might come when I will re-use it for other challenges! :) 