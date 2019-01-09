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

<!---more--->

{% note info %}

1. This post is mainly for the people who already uses hexo platform for generating static websites.
3. I use [Hexo-Theme-Next](http://theme-next.org/), which is the most used theme in hexo platform, the post is applicable for this theme, may be applicable for other themes as well.

{% endnote %}

### Create Hexo Blog and Deploy with Netlify

There is an article written in Netlify's website, that explains creating a blog using Hexo and deploying with Netlify.  Refer this [link](https://www.netlify.com/blog/2015/10/26/a-step-by-step-guide-hexo-on-netlify/) if you are going to setup a new blog using hexo.

{% note info %}

Configuring Netlify to build a static site is very easy; which also makes easy to configure Netlify-CMS. 

If you depend on other CI like Travis, Circle-CI or GitLab CI to build your sites, you need to use [different authentication backends](https://www.netlifycms.org/docs/authentication-backends/).

{% endnote %}

### Enable Netlify-CMS

The following steps to be enabled for enabling Netlify-CMS.

#### Update {% label @<head> %} and {% label @<body> %}
There would be few lines of codes to be added in {% label @<head> %} and {% label @<body> %} sections, in order to enable Identity services.

There are multiple ways to do it, I prefer the easiest way by updating it in the netlify settings.  Go to https://app.netlify.com/ select your project name > Site Settings > Build & Deploy > Post processing > Snippet injection > Add Snippet, then add the following codes in Head and Body sections.

##### Head Section
{% code block %}
<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
{% endblock %}

##### Body Section
{% code block %}
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
{% endblock %}

The outcome should look like this, if you have used the 3rd option.

![netlify_snippet_injection]()

#### Enable Netlify Identity
Netlify Identity Services to be enabled for adding users and enable authentication to them.  Go to Settings > Identity > Enable Identity

You may add Github / GitLab / BitBucket / Google as external providers.  You may select where you have hosted your website contents.

![netlify_identity_external_providers]()

#### Enable Git Gateway
Git Gateway connects the site with GitHub’s API.  Netlify would create branches, update, commit content, etc., This should be enabled in the Identity > Services section.

![netlify_git_gateway]()

#### Modify the Site Contents to Enable Netlify-CMS
Create a folder called {% label @admin %} under the source folder and create two files in it.

![netlify_admin_folder]()

##### Index.html
This file is used for displaying the content management system.  There is no changes required on the existing code; copy the following and put it in {% label @index.html %} file.

{% code block %}
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
{% endblock %}

{% note info %}
You may change the title of the CMS page similar to your website, instead of 'Content Manager'
{% endnote %}

#### config.yml
This file is used to configure the {% label @Front Matter %} of the blog posts.  There are few modifications needed on the code, based on your requirement.

{% code block %}
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
{% endblock %}

refer the following table to understand the each of the parameter.
