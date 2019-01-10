---
title: Integrate Netlify-CMS with Hexo
date: 2019-01-08T13:01:15.653Z
updated: 2019-01-08T13:01:15.728Z
category:
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
---
People create blogs and start writing posts frequently in the beginning and stops it gradually to zero.  I guess there are 3 types are people who writes blog.

1. Who sees the platform as fresh, creates a blog starts writing a post or two then forget
2. Who setup a blog, spending more time on tweaking than actually writing
3. Who doesn't create a blog, opt the ready-made one available in the market such as [Medium](https://medium.com)


I feel there should be a medium to write something like a paper, notebook, diary to convert a thought that flash in our mind to a post or article.  When the {% label @gap %} increases on converting a thought to writing, it will never be written. The medium is the main obstacle that reduces the frequency of blog posts and makes to zero at the end.


I started writing in this blog in a text editor, push it to git.  I have to write it only on my personal computer, where git installed.  When I don't have a computer with git installed, the {% label @gap %} increases.  I want to get rid of the obstacle.
Found [netlify-cms](https://www.netlifycms.org/) as the better alternate to write blog posts, preview then publish.



{% note default %}

1. This post is mainly for the people who already uses hexo platform for generating static websites.
2. I use [Hexo-Theme-Next](http://theme-next.org/), which is the most used theme in hexo platform, the post is 100% compatible for this theme, may be applicable for other themes as well.

{% endnote %}

### Create Hexo Blog and Deploy with Netlify

There is an article written in Netlify's website, that explains creating a blog using Hexo and deploying with Netlify.  Refer this [link](https://www.netlify.com/blog/2015/10/26/a-step-by-step-guide-hexo-on-netlify/) if you are going to setup a new blog using [Hexo](https://hexo.io) or going to use [Netlify](https://www.netlify.com) as CI for building your blog.


{% note info %}
Configuring Netlify to build a static site is very easy; which also makes easy to configure Netlify-CMS. 
If you depend on other CI like Travis, Circle-CI or GitLab CI to build your sites, you need to use [different authentication backends](https://www.netlifycms.org/docs/authentication-backends/), which I have not tried yet.
{% endnote %}

### Enable Netlify-CMS

The following steps to be enabled for enabling Netlify-CMS.

1. Update `<head>` and `<body>` tags
2. Enable Netlify Identity Services
3. Enable Git Gateway
4. Configure CMS admin panel

#### Update `<head>` and `<body>` tagsThere would be few lines of codes to be added in `<head>` and `<body>` sections, in order to enable Identity services.

There are multiple ways to do it, I prefer the easiest way by updating it in the netlify settings.  Go to https://app.netlify.com/ select your {% label @project name %} > {% label @Site Settings %} > {% label @Build & Deploy %} > {% label @Post processing %} > {% label @Snippet injection %} > {% label @Add Snippet %}, then add the following codes in Head and Body sections.

##### Head Section `<head>`
{% code `<head>` %}
<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
{% endcode %}

##### Body Section
{% code `<body>` %}
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
{% endcode %}

The outcome should look like this, if you have used the 3rd option.

![netlify_snippet_injection]()

#### Enable Netlify Identity
Netlify Identity Services to be enabled for adding users and enable authentication to them.  Go to {% label @Settings %} > {% label @Identity %} > {% label @Enable Identity %}

You may add Github / GitLab / BitBucket / Google as external providers.

![netlify_identity_external_providers](<>)

#### Enable Git Gateway
Git Gateway connects the site with GitHub’s API.  Netlify would create branches, update, commit content, etc., This should be enabled in the Identity > Services section.

![netlify_git_gateway]()

### Modify the Site Contents
#### Configure CMS Admin Panel
There would be small changes required in the site contents, which would help to setup the [Front-matter](https://hexo.io/docs/front-matter).  Create a folder called {% label @admin %} under the source folder and add the following two files in it.

![netlify_admin_folder](<>)

##### index.html
This file is used for displaying the content management system. Copy the following and put it in {% label @index.html %} file, without making any changes.

{% code source/index.html %}
---
layout: false
---
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
{% endcode %}

##### config.yml
This file is used to configure the [Front-matter](https://hexo.io/docs/front-matter) of the blog posts.  There are few modifications needed on the code, based on your requirement.

{% code admin/config.yml %}
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
    slug: "integrate-netlify-cms-with-hexo" # Filename template, e.g., YYYY-MM-DD-title.md
    fields: # The fields for each document, usually in front matter
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", required: true, widget: "datetime"}
      - {label: "Edited Date", name: "updated", required: true, widget: "datetime"}
      - {label: "Categories", name: "category", required: true, widget: "list"}
      - {label: "Tags", name: "tags", required: false, widget: "list"}
      - {label: "Keywords", name: "keywords", required: false, widget: "list"}
      - {label: "Body", name: "body", widget: "markdown"}
      - {label: "Display Comments", name: "comments", required: false, widget: "boolean", default: true}
{% endcode %}

I have tried explaining each part of the above code, which may helpful.

| parameter | description |
| - | - |
| `backend` > `name` | keep it default as `git-gateway` unless you want to enable [different authentication backends](https://www.netlifycms.org/docs/authentication-backends/) |
| `backend` > `branch` | update the {% label danger @branch %} name where the site contents / source code is saved. |
| publish_mode: editorial_workflow | refer this [link](/https://www.netlifycms.org/docs/configuration-options/#publish-mode) for detailed explanation. Editorial Workflow works only for GitHub as of now. Comment / delete this line if you are using other hosts such as GitLab or BitBucket. |
| media_folder | this should refer the images folder of the site contents. The default folder for hexo is located at `source/images` |
| public_folder | this is where the images are available after building the site. The default folder for hexo is located at `/images` |
| collections | Collections are explained very well [here](https://www.netlifycms.org/docs/configuration-options/#collections).  You can keep the source code as it is given, which works well for almost all the hexo themes.  You may add additional collections based on the requirement. |

{% note info %}
Netlify CMS is following different way in creating a draft post and preview it using `editorial_workflow`.  It creates a pull request from the existing repo for each blog post. It builds the site immediately and available for preview in different URL than the site's URL. Once the post is made {% label @Ready %} and {% label @Published %}, Netlify-CMS closes the pull request by merging the changes and deleting the branch.

**This Works only on Github**.  GitLab and BitBucket works differently.{% endnote %}

#### Building Sites
You might have used `hexo g` or `hexo generate` as the command to build your site.  Refer the following to fix a bug, that doesn't load CMS page.

##### Fixing Bug
I had an issue after making all the above configurations and I was unable to access the CMS page by visiting https://blog.anbuchelva.in/admin page.  Found that the `config.yml` which we have updated got renamed as `config.json` with some changes after building the site. So I had to copy this file from `source/admin` folder to `public/admin` folder. I had to do this step once CI build the site.

So, I have put this code in the `package.json` file as {% label @script %}. Refer my `package.json` file from line number 8 to 10.  The script should be called after building the site as `hexo g && npm run netlify-cms`.
{% code package.json %}
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "hexo": {
    "version": "3.8.0"
  },
  "scripts": {
    "netlify-cms": "cp source/admin/config.yml public/admin/config.yml"
  },
  "dependencies": {
    "hexo": "^3.8.0",
    "hexo-filter-optimize": "^0.2.5",
    "hexo-generator-archive": "^0.1.5",
    "hexo-generator-better-sitemap": "^0.1.1",
    "hexo-generator-category": "^0.1.3",
    "hexo-generator-feed": "^1.2.2",
    "hexo-generator-index": "^0.2.1",
    "hexo-generator-searchdb": "^1.0.8",
    "hexo-generator-tag": "^0.2.0",
    "hexo-renderer-ejs": "^0.3.1",
    "hexo-renderer-markdown-it-plus": "^1.0.4",
    "hexo-renderer-stylus": "^0.3.3",
    "hexo-server": "^0.3.3",
    "hexo-symbols-count-time": "^0.4.4",
    "markdown-it-emoji": "^1.4.0"
  }
}
{% endcode %}

##### Configure netlify.toml for Building Sites
You can add build commands in the Site settings of Netlify page.  However, you may configure additional steps by creating `netlify.toml` file in the root of the site folder.

{% code netlify.toml %}
[build]
  publish = "public/"
  command = "hexo clean && hexo g && npm run netlify-cms"
  environment = {NODE_ENV = "8.10.0"}
{% endcode %}

This file would override the settings, that you have enabled in the netlify setting page.

#### Use Cloudinary as media folder

Hosting images in the git repo is a bad idea, as the repo size would gradually increase.  Also GitHub started [providing free private repositories](/git/github-offers-unlimited-free-private-repositories/), you might want your site contents to be hidden from prying eyes.  So, I would suggest using http://cloudinary.com for hosting the site images.

You need to create a free account from cloudinary and get the required details from the dashboard page.  Then configure the `source/admin/config.yml` file as like below; refer lines between 7 and 13.

Documentation on configuring netlify with clouodinary is available [here](https://www.netlifycms.org/docs/cloudinary/), if you wish to tweak further.

{% code source/admin/config.yml %}
backend:
  name: git-gateway
  branch: source # Branch to update (optional; defaults to master)

publish_mode: editorial_workflow

media_library:
  name: cloudinary
  output_filename_only: false
  config:
    cloud_name: # your cloudinary name available in the dashboard    api_key: # api key that you get from cloudinary dashboard    username: # the user id, which is used to create the cloudinary account
collections:

* name: "posts" # Used in routes, e.g., /admin/collections/blog
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
  {% endcode %}

### Conclusion
Having a proper CMS setup would help to make the writing easy and spontaneous. `git` is not needed for pushing the creating / modifying the content of the site. It helps to focus more on writing than tweaking the existing layouts.

#### Next Steps
1. I might need to explore the options to create custom widgets to include [Tag Plugins for Hexo](https://hexo.io/docs/tag-plugins) and [Tag Plugins for Next](https://theme-next.org/docs/tag-plugins/)
2. I might need to find a way to tweak the preview of markdown in the CMS portal, which is not in sync with the site.
