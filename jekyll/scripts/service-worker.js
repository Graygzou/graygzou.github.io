---
layout: null
---
const staticCacheName = "gregoire-boiron-portfolio";

const filesToCache = [
    '/',
    {% for page in site.html_pages %}'{{ page.url }}',
    {% endfor %}
    {% for post in site.posts %}'{{ post.url }}'{% unless forloop.last %},
    {% endunless %}{% endfor %}
];

/*
<!-- "/assets/images/bhavri-github-callbacks.png",
    "/assets/images/bhavri-github-issues.png",
    "/assets/images/jakethecake-svg-line-anime.png",
    "/assets/images/svg-animated-mast-text-shapes-tweet.png",
    "css/main.css",
    "/about/",
    "/index.html" -->*/

console.log("installing service worker");

self.addEventListener("install", function(e){
    self.skipWaiting();
    e.waitUntil(
        caches.open(staticCacheName).then(function(cache){
            filesToCache.map(function(url){
                return cache.add(url).catch(function (reason) {
                    return console.log(url + 'failed: ' + String(reason));
                });
            })
        })
    )
});

self.addEventListener("activate", function(e){
    e.waitUntil(
        caches.keys().then(function(cacheNames){
            return Promise.all(
                cacheNames.filter(function(cacheName){
                    return cacheName.startsWith("gregoire-boiron-portfolio") && cacheName != staticCacheName;
                }).map(function(cacheName){
                    return caches.delete(cacheName);
                })
            )
        })
    )
});

self.addEventListener("fetch", function(e){
    e.respondWith(
        caches.match(e.request).then(function(response) {
            return response || fetch(e.request);
        })
    )
});