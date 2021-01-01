---
title: "vinylSpotting, a Discogs fairytale"
description: "A web app for record diggers to explore and visualize their collections."
date: "2017-03-01"
tags: ["music", "shiny"]
slug: vinylspotting-discogs-fairytale
draft: no
---

At a glance, it's hard to learn much about a vinyl record collection beyond it's size (or perhaps age, depending on the smell?). If you get up close, you might recognise names on the spines of some LPs, but some collectors are gonna have bits that even *they* don't recognise on sight. Now, while the unadulterated excitement of finding a [white label](https://en.wikipedia.org/wiki/White_label) on the shelve that even *you* can't remember might fuel the romance at the heart of record digging, just the thought of such forgotten artifacts would make archivists and librarians nervous. 

Enter [Discogs](http://www.discogs.com) - the definitive recorded music database and marketplace, with over 8 million record entries and counting. Aside from tumbling through all sorts of audio rabbit-holes, Discogs users can forensically catalog their own collection. Once you've reached a few hundred records, having a well-kept digital archive of your music to refer to is sometimes the only way of answering *"did I already buy that record?"*, without having to leaf through the physical lot.

A user can browse through the individual entries for each of their records, see an overview of their whole collection:

![Discogs collection overview](/blog/2017-03-01-vinylspotting-discogs-fairytale_files/discogs-collection-page.png)

It's essentially a tabulated view of your records with rudimentary info, and some record sleeve thumbnails to boot. The 'collection value' is a new addition that, as far as I can tell, is the **only** summary statistic on show (besides the count), which got me thinking:

> If I've amassed hundreds (or thousand) of records, and carefully keyed each into a digital database, it would be cool to learn a bit more about my collection beyond it's monetary worth.

My next thought was, "[Shiny](https://shiny.rstudio.com/) could probably help with that".

## Unpacking "it would be cool to learn a bit more"

How could you explore someones record collection metadata, visually, in a useful and coherent way?

A few concepts were prominent in my head-space:

* Part of **what makes a record collection unique and special is how it evolves over time**: it's not static and intakes distinct phases. I had to find a way to make this temporal element a central thread.
* Aside from insight about what's *in* their collection, something else that could be interpreted from the metadata records was **a snapshot of user's buying patterns.**
* The somewhat on-rails experience of a Shiny app seemed like a suitable environment to aid record collectors' discovery, essentially **a natural, digital extension of the digging process.**
* The app should mirror the treasured and personal state of the subject matter. In keeping, the **language adopted should be idiosyncratic and approachable.**

## Introducing vinylSpotting

*vinylSpotting* is now available for diggers everywhere over [here](https://apps.ewen.io/vinylspotting), with a tiny showcase below.

![vinylSpotting showcase](/blog/2017-03-01-vinylspotting-discogs-fairytale_files/vinyspotting-preview.gif)

Head over to the app itself to play, then check the [github repo](https://github.com/ewenme/vinylspotting) if you want to see the Shiny code. Behind the scenes, *vinylSpotting* retrieves public Discogs collections via the [Discogs API v2.0](https://www.discogs.com/developers/) (sidenote - the data heavy lifting is made simple courtesy of the [discogger](https://github.com/ewenme/discogger) package, in case you want to use the Discogs API in your own project).

## To do's / limitations

The most glaring omission here is any kind of spend analytics - unfortunately, Discogs don't offer up their marketplace sales data in the public API offering (though there has been previous for publications to get exclusive access (hint, hint)) so for now, it's off limits. Something that I chose to exclude was record's rating data (i.e. what the average rating for a record was), which felt like it could be noise in an app that would explore a single user's collection and, thus, would mostly contain records that person already rated highly (i.e. they bought it).

Also, the current measure of buying patterns, assuming that a record was bought at the time it was added to the site, is only as accurate as the users timeliness in pushing their new records to the site when they buy them. It may be that for some users who sit on a backlog of records and upload them to the site all at once, such proxies become skewed.

With time, an interesting exercise could be to fit a time series model to user's collections to provide a forecast of the size of their collection in the future. The recently open-sourced [Prophet](https://facebookincubator.github.io/prophet/) could be a suitably flexible procedure to implement in a Shiny app environment.
