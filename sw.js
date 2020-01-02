const staticCacheName = "gregoire-boiron-portfolio";

const filesToCache = [
    '/',
    '/404.html',
    '/about/',
    '/blog/',
    '/',
    '/projects/',
    '/resume/',
    
    '/blog/challenges/2019/12/31/what-i-ve-learned-during-advent-of-code-2019.html',
    '/blog/challenges/2019/10/10/summary-of-my-first-participation-of-advent-of-code-2018.html',
    '/blog/c++/2019/09/28/tips-and-tricks-ccp.html',
    '/blog/jekyll/update/2019/07/28/getting-start-with-jekyll.html'
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