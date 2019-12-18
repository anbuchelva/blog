---
draft: true
comments: true
toc: true
title: Forestry.io as CMS for Hexo
date: 2019-12-18T00:00:00+05:30
updated: 
category:
- blog
tags:
- blog
- hexo
- cms
keywords:
- forestry
- netlify
- hexo

---
There are many ways to write and publish blog posts, when it comes to git backed static websites.

I started with text editor for writing, terminal for building, then push it to github pages for publishing

Then I started using Netlify for building static pages, but was still using text editor and terminal locally.

One fine day, I set up Netlify CMS for content management, as I wanted it to write in any PC, which do not have git & npm installed.

I tried forestry.io for writing posts for Jekyll & Hugo (during my initial testing to decide which static site platform to choose).  But I couldn't make it work for hexo during the initial times.

I have succeeded using forestry.io as CMS for hexo and this post is being written in the same platform and sharing my experiences here.

<!---more--->

### Prerequisites

Almost none additionally.  Just login to forestry.io using your github or gitlab or bitbucket credentials, then connect to your repository which had the sources to build the blog.

{% note info %}

There is a post that explains how to {% post_link integrate-netlify-cms-with-hexo %}.  You may refer it, which will be useful to understand the CMS on hexo platform.

{% endnote %}