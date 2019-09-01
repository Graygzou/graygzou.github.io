---
layout: post
title:  "Welcome to Jekyll!"
date:   2019-07-27 20:26:29 -0400
categories: jekyll update
---

Ref: https://jekyllrb.com/tutorials/using-jekyll-with-bundler/

What you need to do :
```
$ bundle install --path vendor/bundle
```

if already installed run
```
$ bundle update
or
$ bundle add jekyll
```

then run
```
$ bundle exec jekyll new --force --skip-bundle .
$ bundle install
```

Finally run
`$ bundle exec jekyll serve`

%%%%%%%%
Ref: https://jekyllrb.com/docs/themes/#overriding-theme-defaults

Create own theme (overriding existing one)

First find the one you already using. To do that simply run
```
bundle show <theme name>
```
like `bundle show minima` which is jekyll default theme.

Give you all the file you need to override to create your theme.

Jekyll also offers powerful support for code snippets:
The README.md is a really good source of knowledge.

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
