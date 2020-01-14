<!--- Grégoire Boiron <gregoire.boiron@gmail.com> --->
<!--- Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved. --->


Screenshots
--------------------
Isn't it more fun to navigate the site directly? :grin:

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

#### Custom build pipeline
Like a lot of people do, I decided to host my website on Github thanks to Github Page.

But before deploying the `site/` folder that is hooked to the github page deployment, I execute a couple of steps.
All of that thanks to [Travis CI](https://travis-ci.com/) which allows me to execute it every time I commit changes and also set up cron jobs that run every week (or day if I wish).

<!--![Pipeline image]()--> <!-- TODO -->

The steps are the following :
0. Write the **static data** of repositories (not available in the GitHub API)
1. The build is trigger with either a commit or by the Cron job.
2. _The VM is setup to handle the build correctly_
3. Python scripts are triggered:
 * The first python script will make `HTTP` request to the `REST` [GitHub API](https://developer.github.com/v3/) to get information about my repositories.
   Those *information will be merged* with the static data in step 0.
 * The second python script** will create `.xml` files that will triage all the svg icon the website is using.
5. The website is build thanks to jekyll command `jekyll build`.
6. Third party libraries are triggered. [`html-proofer`](https://github.com/gjtorikian/html-proofer) is the only one for the moment to check if the generate website is legit.
7. The final website is upload by a bot to the correct branch.


#### Challenges
The trickier part was merging static data with API one. 
Indeed, you cannot found ready to go methods to do that so you have to iterate and find the best way to do it.

To give an example, I took some time to know **what would be the more suitable merging process** in my case.
I had many different version :

1. Create one big static file and add GitHub data in the right place (in the front matter section for instance)
2. Merge the GitHub API information with the static front matter one and then append it with the content itself
3. Merge everything to create a new page every time a build is triggered.

I've tried all methods and I end-up choosing the last one for is convenience.
In fact, finding the right place to insert the front matter was quite harder and append stuff to an existing file could be challenging since some information might be static some needed to be re-generated etc.

This might not seems the more optimize method but it's the easier and shortest for sure.
Plus, I don't have any constraint on deployment since it's just a personal website. :grin:

#### Links
Made sure everything was as good as possible. I used third party links like:</p>
* [W3C](https://validator.w3.org/nu/?doc=https%3A%2F%2Fgraygzou.github.io) to check html standards.
* [google developers](https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fgraygzou.github.io) service to check overall speed of pages.