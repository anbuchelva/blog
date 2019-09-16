---
title: GitHub Offers Unlimited Free Private Repositories
date: 2019-01-08T06:19:16.047Z
updated: 2019-01-08T06:19:16.110Z
category:
  - git
tags:
  - git
  - github
keywords:
  - git
  - github
  - gitlab
  - private repositories
comments: true
---
Starting today [GitHub](https://github.com/) offers unlimited free private repositories, which is a long expected one as the competitors  like [GitLab](https://githlab.com) and [BitBucket](https://bitbucket.org) are already doing it.

Since Microsoft acquired GitHub last year, I expected this change.  However, the business model might affect if they do it, as most of the projects hosted in GitHub compared to the competitors.

There will be Pros and Cons on this change.

<!---more--->

### The Process

Creating new repository has an option to choose between Private and Public, which is very simple.

To make an existing repo private, go to {% label @Settings %} of the repository and scroll to the bottom where the {% label @Danger Zone %} exists and select the option to make the repository private.

![github_Private_repo_danger_zone](https://res.cloudinary.com/anbuchelva/image/upload/v1546930142/images/github_private_repo/github_Private_repo_danger_zone.png)

You cannot make a repo to private, if it is forked from a public repo and Github asks to make a fresh repo for such cases.

![github_Private_repo_forked_repo_private](https://res.cloudinary.com/anbuchelva/image/upload/v1546930142/images/github_private_repo/github_Private_repo_forked_repo_private.png)

Once you click on the {% label @Make Private %} button, it would ask to enter the repo name for confirmation.

![github_Private_repo_confirmation](https://res.cloudinary.com/anbuchelva/image/upload/v1546930142/images/github_private_repo/github_Private_repo_confirmation.png)

Done! These steps makes the existing repo private.

### The Caveats

There are few things to notice, when the repos are made private.  

#### Data Services

First thing to notice when the repo is private github stop accessing it unless you give persission. So there won't be any audit done on the codes; vulnerability alers are disabled. Providing read-only access would solve the issue.

![github_Private_repo_data_services](https://res.cloudinary.com/anbuchelva/image/upload/v1546930142/images/github_private_repo/github_Private_repo_data_services.png)

#### Github Wikis

Github Wikis will not be enabled for private repos, unless pro version is puchased.  It is expected when the repo is private it is hidden from everyone, including wiki.

![github_Private_repo_features](https://res.cloudinary.com/anbuchelva/image/upload/v1546930143/images/github_private_repo/github_Private_repo_features.png)

#### GitHub Pages

Github pages won't work on private repos, either the repository to be public or the pro version should be purchased.

![github_Private_repo_github_pages](https://res.cloudinary.com/anbuchelva/image/upload/v1546930142/images/github_private_repo/github_Private_repo_github_pages.png)

{% note warning %}
If there is any static website hosted on github repo, the content and the images of the repo become private and won't be accessible.
{% endnote %}

### Make it Public Again

The Process is same. Visit the {% label @Settings %} of the repo, then {% label @Danger Zone %} and make it public.  Enter the repo name on the confirmation page.

![github_Private_repo_make_public](https://res.cloudinary.com/anbuchelva/image/upload/v1546930143/images/github_private_repo/github_Private_repo_make_public.png)

### The Pros and Cons

* The change is very much expected for a long time, as people may want to hide their important projects from prying eyes.
* Since GitHub hosts most of the project and an user need not to switch between different providers for having private repos for free.
* Small organizations would benefit from this change as they can have free private repos with unlimited users.

It might have negative impact on the growing developers,

* A developer groom by seeing the codes written by others and learn.  If the option of making a repo is easy, most people might hide their work.
