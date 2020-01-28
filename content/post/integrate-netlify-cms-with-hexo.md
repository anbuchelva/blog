---
title: "Integrate Netlify-CMS with Hexo"
date: 2019-01-08T13:01:15.653Z
updated: 2019-01-10T23:30:15.728Z
categories:
  - blog
tags:
  - hexo
  - netlify
  - netlify-cms
keywords:
  - hexo
  - netlify
  - netlify-cms
comments: true
thumbnailimage: "https://res.cloudinary.com/anbuchelva/image/upload/c_scale,h_250,f_auto,q_auto/v1578787447/images/netlify-cms/logomark_1.png"

url: "/blog/integrate-netlify-cms-with-hexo/"
---
**Why Content Management System is needed for writing blogs?**  

People create blogs and start writing posts frequently in the beginning and stops it gradually to zero.  I would say there are 3 types of people who write blogs.  
<!--more-->
1. Who sees the platform as fresh, creates a blog starts writing a post or two then forget
2. Who setup a blog, spending more time on tweaking the layout of the site than actually writing
3. Who doesn't create a blog, opt the ready-made one available in the market such as [Medium](https://medium.com)

The people who setup static websites falls in the first two categories.

I feel there should be a medium to write something like a paper, notebook, diary to convert a thought that flash in our mind to a blog post.  When the`gap` increases in converting a thought into writing, probably it will never be written. The medium is the main obstacle that reduces the frequency of blog posts and makes to zero at the end.

I started writing in this blog in a text editor, push it to git.  The main obstacle is that, I have to write it only on my personal computer, where git installed.  When I don't have a computer with git installed, the`gap` increases.  I want to get rid of this.

Found [Netlify-CMS](https://www.netlifycms.org/) as the better alternate to write blog posts, preview then publish.

I would wanted to write my experience in setting up Netlify-CMS for this blog.

{{< alert info >}}
This post is mainly for the people who already uses [Hexo](https://hexo.io/) platform for generating static websites.
I use [Hexo-Theme-Next](http://theme-next.org/), which is the most used theme in Hexo platform, the post is 100% compatible for this theme, may be used as base for  other Hexo themes as well.
{{< /alert >}}

<!-- toc -->
# Create Hexo Blog and Deploy with Netlify

There is an article written in Netlify's website, that explains how to create a blog using Hexo and deploy with Netlify.  Refer this [link](https://www.netlify.com/blog/2015/10/26/a-step-by-step-guide-hexo-on-netlify/) if you are going to setup a new blog using [Hexo](https://hexo.io) or going to use [Netlify](https://www.netlify.com) as CI for building your blog.
{{< alert info >}}
Configuring Netlify to build a static site is very easy; which also makes easy to configure Netlify-CMS. 
If you depend on other CI like Travis, Circle-CI or GitLab CI to build your sites, you need to use [different authentication backends](https://www.netlifycms.org/docs/authentication-backends/), which I have not tried yet.
{{< /alert >}}

# Enable Netlify-CMS

The following steps to be enabled for enabling Netlify-CMS.

1. [Update`<head>` and`<body>` tags](#update-head-and-body-tags)
2. [Enable Netlify Identity Services](#enable-netlify-identity)
3. [Enable Git Gateway](#enable-git-gateway)
4. [Configure CMS admin panel](#configure-cms-admin-panel)
5. [Build Site without Bugs](#building-sites)
6. [Cloudinary as CDN for media](#use-cloudinary-as-media-folder)

## Update`<head>` and`<body>` tags
There would be few lines of codes to be added in`<head>` and`<body>` sections, in order to enable Identity services.

There are multiple ways to do it, I prefer the easiest way by updating it in the netlify settings.  Go to https://app.netlify.com/ select your`project name` >`Site Settings` >`Build & Deploy` >`Post processing` >`Snippet injection` >`Add Snippet`, then add the following codes in Head and Body sections.

### Head Section`<head>`
```
<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
```

### Body Section`<body>`
```
<script>
  if (window.netlifyIdentity) {
    window.netlifyIdentity.on("init", user => {
      if (!user) {
        window.netlifyIdentity.on("login", () => {
          document.location.href = "/admin/";
        });
      }
    });
  }
</script>
```

The outcome should look like this.

![netlify_snippet_injection](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1547140285/images/netlify-cms/netlify_snippet_injection.png)

## Enable Netlify Identity
Netlify Identity Services to be enabled for adding users and to enable authentication to them.  Go to`Settings` >`Identity` >`Enable Identity`

You may add Github / GitLab / BitBucket / Google as external providers, if you or your users want to login any of these services for writing posts.

![netlify_identity_external_providers](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1547140145/images/netlify-cms/netlify_identity_external_providers.png)

## Enable Git Gateway
Git Gateway connects the site to the git provider's API. This should be enabled in the`Identity` >`Services` section.

![netlify_git_gateway](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1547140429/images/netlify-cms/netlify_git_gateway.png)

# Modify the Site Contents
There would be small changes required in the site contents, which would help to setup the [Front-matter](https://hexo.io/docs/front-matter).

## Configure CMS Admin Panel
Create a folder called`admin` under the source folder and add the following two files in it.

![netlify_admin_folder](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1547141203/images/netlify-cms/netlify_admin_folder.png)

### index.html
This file is used for displaying the content management system. Copy the following code and put it in`index.html` file, without making any changes.

```
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Content Manager</title>
</head>
<body>
  <!-- Include the script that builds the page and powers Netlify CMS -->
  <script src="https://unpkg.com/netlify-cms@^2.0.0/dist/netlify-cms.js"></script>
</body>
</html>
```

### config.yml  
This file is used to configure the [Front-matter](https://hexo.io/docs/front-matter) of the blog posts.  There are few modifications needed on the code, based on your requirement.

```
backend:
  name: git-gateway
  branch: source # Branch to update (optional; defaults to master)

publish_mode: editorial_workflow

media_folder: "source/images" # Media files will be stored in the repo under static/images/uploads
public_folder: "/images" # The src attribute for uploaded media will begin with /images/uploads

collections:
  - name: "posts" # Used in routes, e.g., /admin/collections/blog
    label: "Post" # Used in the UI
    folder: "source/_posts" # The path to the folder where the documents are stored
    create: true # Allow users to create new documents in this collection
    slug: "{{slug}}" # Filename template, e.g., YYYY-MM-DD-title.md
    fields: # The fields for each document, usually in front matter
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", required: true, widget: "datetime"}
      - {label: "Edited Date", name: "updated", required: true, widget: "datetime"}
      - {label: "Categories", name: "category", required: true, widget: "list"}
      - {label: "Tags", name: "tags", required: false, widget: "list"}
      - {label: "Keywords", name: "keywords", required: false, widget: "list"}
      - {label: "Body", name: "body", widget: "markdown"}
      - {label: "Display Comments", name: "comments", required: false, widget: "boolean", default: true}
```

I have tried explaining each part of the above code, which may helpful.

|Parameter |Description |
|---|---|
|`name` | Keep it default as`git-gateway` unless you want to enable [different authentication backends](https://www.netlifycms.org/docs/authentication-backends/) |
|`branch` | Update the`branch` name where the site contents / source code is saved. |
| publish_mode:  editorial_workflow | Refer this [link](https://www.netlifycms.org/docs/configuration-options/#publish-mode) for detailed explanation. Editorial Workflow works only for GitHub as of now. Comment or delete this line if you are using other hosts such as GitLab or BitBucket. |
| media_folder | This is where the images are stored in the source of the site. The default folder for hexo is located at`source/images` |
| public_folder | This is where the images are available after building the site. The default folder for hexo is located at`/images` |
| collections | Collections are explained very well [here](https://www.netlifycms.org/docs/configuration-options/#collections).  You can keep the source code without any changes, which works well for almost all the hexo themes.  You may add additional collections based on the requirement. |

Netlify CMS is following different way in creating a draft post and preview it using`editorial_workflow` than Hexo is designed for drafting a post.  It creates a pull request from the existing repo for each blog post. It builds the site immediately and available for preview in a unique URL. Once the post is made`Ready` and`Published`, Netlify-CMS closes the pull request by merging the changes to the branch where the source is saved and deleting the branch made by pull request.

![netlify_cms_editorial_workflow](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1547142063/images/netlify-cms/netlify_cms_editorial_workflow.png)

{{< alert warning >}}
Editorial Workflow i.e., creating a pull request / merging it back is applicable only for Github.  GitLab and BitBucket works differently.
{{< /alert >}}

## Building Sites
You might have used`hexo g` or`hexo generate` command to build the site. Though, the CMS wouldn't load.  Refer the following portion that fixes a bug.

### Fixing Bug in rendering CMS Admin
I had an issue after making all the above configurations and I was unable to access the CMS page by visiting /admin page.  Found that, the`source/admin/config.yml` is renamed as`public/admin/config.json` with some modification after building the site. This can be fixed by adding admin folder contents in the`skip_render` option of hexo`config.yml` file.
```
skip_render: admin/*
```

### Configure netlify.toml for Building Sites

{{< alert info >}}
This section is optional one.
{{< /alert >}}

You can add build commands in the Site settings of Netlify page.  However, you may configure additional steps by creating`netlify.toml` file in the root of the site folder.

```
[build]
  publish = "public/"
  command = "hexo clean && hexo g"
  environment = {NODE_ENV = "8.10.0"}
```

This file would override the settings, that you mention in the netlify setting page.
## Use Cloudinary as Media Folder
{{< alert info >}}
This section is optional one.
{{< /alert >}}

Hosting images in the git repo is a bad idea, as the repo size would gradually increase when new posts are added with new images.  Also GitHub started [providing free private repositories](/git/github-offers-unlimited-free-private-repositories/), you might want the source of your site contents to be hidden from others. So, I would suggest using http://cloudinary.com for hosting the site images.

You need to create a free account from cloudinary and get the required details from the dashboard page.  Then configure the`source/admin/config.yml` file as like below; refer lines between 7 and 13.

Documentation on configuring netlify with clouodinary is available [here](https://www.netlifycms.org/docs/cloudinary/), if you wish to tweak further.

``` source/admin/config.yml
backend:
  name: git-gateway
  branch: source # Branch to update (optional; defaults to master)

publish_mode: editorial_workflow

media_library:
  name: cloudinary
  output_filename_only: false #false = bring the file name with entire path true = bring file name only
  config:
    cloud_name: # your cloudinary name available in the dashboard
    api_key: # api key that you get from cloudinary dashboard
    username: # the user id, which is used to create the cloudinary account

collections:
  - name: "posts" # Used in routes, e.g., /admin/collections/blog
    label: "Post" # Used in the UI
    folder: "source/_posts" # The path to the folder where the documents are stored
    create: true # Allow users to create new documents in this collection
    slug: "{{slug}}" # Filename template, e.g., YYYY-MM-DD-title.md
    fields: # The fields for each document, usually in front matter
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", required: true, widget: "datetime"}
      - {label: "Edited Date", name: "updated", required: true, widget: "datetime"}
      - {label: "Categories", name: "category", required: true, widget: "list"}
      - {label: "Tags", name: "tags", required: false, widget: "list"}
      - {label: "Keywords", name: "keywords", required: false, widget: "list"}
      - {label: "Body", name: "body", widget: "markdown"}
      - {label: "Display Comments", name: "comments", required: false, widget: "boolean", default: true}
```

# Conclusion
* Having a proper CMS setup would help to make the writing easy and spontaneous. 
* Need not to depend on the personal computer with`git` and`hexo` configured to push the commits or previewing the changes. 
* It helps to focus more on writing than tweaking the existing layouts.

## Next Steps
* I might need to explore the options to create [custom widgets](https://www.netlifycms.org/docs/custom-widgets/) to include [Tag Plugins for Hexo](https://hexo.io/docs/tag-plugins) and [Tag Plugins for Next](https://theme-next.org/docs/tag-plugins/)
* I might need to find a way to tweak the preview of markdown in the CMS portal, which is not in sync with the site.
