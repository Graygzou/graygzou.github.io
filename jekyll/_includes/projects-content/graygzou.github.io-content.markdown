<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Screenshots
--------------------
Navigate the site directly, it's more fun right? :grin:

Detailed Info
--------------------

#### My own theme
Jekyll is really powerful because it can be use theme out of the box published by other developers / designers.
A lot of them can be found here : [http://jekyllthemes.org/](http://jekyllthemes.org/).

But after a quick search, I did not find exactly what I wanted. 
Plus I already had a lot of feature coded in HTML + CSS from my previous website that I wanted to keep.

I decided to create my own theme starting from jekyll minimal theme.
The purpose of this theme is to make a simple portfolio without heavy animations, etc. 

Because we all know that people are busy and don't have time to scroll 1000 times to find right information :wink:

#### Build my own pipeline
Like a lot of people do, I decided to host my website on Github with Github Page.

But, each time I commit a change, before deploying it to the right branch, I create some python scripts in order to "generate" some of my project for my website: 
Indeed some information in them come from GitHub directly. 
So those scripts help merging GitHub info (coming from the [GitHub API](https://developer.github.com/v3/)) with static one (committed to the website's repository)  

Travis CI helps a bit in all of that in order to make things smoother. 
Also allowing to hook stuffs like [html-proofer](https://github.com/gjtorikian/html-proofer) for example. 
