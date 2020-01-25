---
title: Blogging in the Hard Way
date: 2018-06-01T08:49:00.000Z
updated: 2018-06-23T08:49:00.000Z
categories:
  - blog
tags:
  - hexo
  - blog
  - netlify
  - travis-ci
  - github pages
  - hexo next theme
keywords:
  - Hexo
  - Blog
  - Netlify
  - Travis-CI
  - Github Pages
  - Hexo Next Theme
toc: true
#thumbnailimage: "https://avatars3.githubusercontent.com/u/29385237?s=280&v=4"
url: "/blog/blogging-in-the-hard-way/"
---
I have started this blog in last November, after that I did not write anything, as like the way it happens every time.  We start something and forget, until we make it as routine.  Meanwhile, I was doing some analysis and checks, etc on the blogging platform.  Like to share the same here..
<!--more-->
{{< alert info >}}
Most of the contents updated in this post aren't relevant today, as I have migrated this blog from [Hexo](https://hexo.io) to [Hugo](https://gohugo.io/) platform, for some reason.  Fore more info visit the [github repository](https://github.com/anbuchelva/blog) where the contents are hosted.
{{< /alert >}}
### The Static Blog Platform
Why Static Blog?  I have tried using the ready-made blogging platforms such as Blogger, WordPress, etc., But I settled with Static blogging platform, for its simplicity and speed, also I want to try something in a hard way to make it work (_Actually setting up a static blog is not that hard_).  

I can write posts when I am off line, using a notepad++. Then just push to git repository when I connected to Internet.  Git provides the history / version control for all the modifications that I do.  If I feel a change that I made recently not working, I can just use `git revert` command to go back to the previous state.

I have tried different static site generators the order listed below:

* [Jekyll](https://jekyllrb.com/) - Lot of themes available, Github build the pages automatically.  But, felt it is slow. ~~Still my primary domain page https://anbuchelva.in is running on Jekyll.~~  **Edit:** Moved to static [page](https://anbuchelva.in) now.
* [Hugo](https://gohugo.io/) - Simple. But Hexo won my heart.
* [Ghost](https://ghost.org/) - Subscription based, not my cup of tea.
* [Hexo](https://hexo.io/) - The Winner!! _though most of the users are from china, thanks to Google translate_
* [Gatsby](https://gatsbyjs.org/) - The post title would have changed to the **Hardest** way, if I have used Gatsby.

I have tried all the platforms finally settled with Hexo for the speed and the vast number of plug-ins. Github pages automatically build pages, if I use Jekyll.  I need a CI to build the site, or I need to deploy it from my PC whenever I write a post using Hexo. I have tried different CI such as Travis-CI, Circle-CI, Netlify, Gitlab CI, etc.,

### Domain
I have purchased this domain from [Google Domains](https://domains.google.com/). I pay $12 per annum for it, which is the only service that I pay money when setting up this blog.

Still thinking of moving it to a different domain name, which can be easily remembered.  I know the the word 'anbuchelva' would be hard to pronounce who are not from South India.

### Hosting
The next question that arise in your mind, what about hosting? Aren't you paying any money for it?
The answer is yes.  I'm not paying anything for hosting, as I host it in [Github pages](https://pages.github.com/)

There are few alternates available such as Gitlab Pages, Bitbucket, Netlify, etc.,  I have settled with Github Pages + Cloudflare for hosting and CDN services.  Github pages provide very fast server response than the others that I have listed above.  This improves the Google page speed drastically.

Still thinking of moving the source of this blog to Gitlab or Bitbucket for privacy and host the pages that are built in Github.  Github doesn't offer Private Repository services for free.  Few differences when comparing Gitlab and Github.

|Service| Gitlab| Github|
|---|---|---|
|**Private Repository**| Unlimited private repositories | Not available |
|**Continuous Integration**|2000 Hours of CI engine per Month| Not available, <br> have to depend on other CI cervices like Travis-CI, Circe-CI, Netlify|
|**Encryption**|The connection is encrypted between Gitlab and Cloudflare | No encryption provided for custom domain |
|**Server Response Time**|Slow|Fast <br> improvement in Google Page Speed test for more than 20 points|
|**Netlify CMS Integration**| Not available yet | Available|

### Cloudflare
I should thank [Cloudflare](https://cloudflare.com) for their free service for ultra fast CDN and free encryption certificate, caching etc.  This increased the site speed from 60/100 to 95+/100.

### Markdown
Writing posts in **Markdown** language is very easy than using traditional **HTML** tags.  It is in readable format so it's easy to modify, when the changes needed. Whenever I make changes and push the commits to git repository, the CI automatically build the site to **HTML** pages.  When the user opens up the website, they access the webpages which are built already.  There's no to and fro data data movement to load the pages.

### Theme
I use [Next](https://github.com/theme-next) in this blog.  Simple and look professional, yet modern. You will really know the customizations when start using it.  I love it!

[Ruda](https://fonts.google.com/specimen/Ruda) font is being used all over the place except the code blocks.  I use the same font in my Android device as well.

### Continuous Integration [aka] CI
There would be a separate post needed, if I want to write about CI and the experiments that I have done, experiences that I have gained with each of the CI platform.  As of now, I use Travis-CI and Netlify for building the site.  I would write a separate post; the link will be available here when I am done.  

### Post Comments
I am still in dilemma whether to use Disqus (_most websites uses it, login using social networking is possible_) or to use [Gitment](https://github.com/imsun/gitment).

There's no privacy guaranteed when using Disqus, Gitment is open sourced and privacy oriented.  The problem is not all the users have github account to use Gitment comment system.  I may add staticman, if I succeed.

### Content Management System
What is the success of Wordpress, the simple content management system.  As of now, I have to depend on my personal computer, where the git is configured and I can locally run Hexo to see the output before publishing any post.  Sometimes it is painful, If I have an online portal, where I can go and write posts and if it automatically publishes it, that's going to be a welcome change.

Currently Netlify provides such option. When a new post created, Netlify creates pull request and builds the website temporarily.  Once we feel the post is ready for publishing, it automatically merge the pull request and delete the temporary branch.

I have set it up already for this blog, but still not using it 100%, as I do some tweaks in the website.  Netlify breaks if there are any commits passed during the draft to publish phase.  Ideally I will move into it in some days.

### Conclusion
 Thanks for reading the large post.  There's no technical details provided how I have setup each of the above mentioned services.  I may write in more detailed way, when I get time. Feel free to comment/ask questions for clarifications.
 
 > Happy Writing!!!
