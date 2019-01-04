---
title: Share Folders between Windows Host and Linux Guest OS
date: 2018-12-25T06:53:10.583Z
updated: 2018-12-25T06:53:10.583Z
category:
  - virtualbox
tags:
  - virtualBox
  - windows
  - linux
keywords:
  - VirtualBox
  - Sharing
  - Windows
  - Linux
---
My laptop was purchased in 2001 configured with i5 2nd Generation, 8+2 GB RAM.  I started having issues when the keyboard gives random inputs and the battery is dead.  It still works good on linux and Windows 7. I couldn't do anything on terminal when the keyboard gives random inputs.

My wife purchased a laptop recently configured with i7 8th Generation, 8 GB RAM. I added an SSD and additional 8 GB RAM and it runs a lot faster than my previous laptop i.e., the boot time is lesser than 20 seconds.  She uses windows as primary operating system and I use Linux as primary.

I used to have it in dual boot mode, but it makes difficult to reboot between different OS.  We have to save the unsaved works, which becomes complicated.

<!---more--->

To solve things, we started using [VirtualBox](https://virtualbox.org/) with [Linux Mint](https://linuxmint.com/) as a guest OS, since the laptop comes with Windows 10 pre-installed.

### The Issue
I share a drive between Host and Guest OS for downloads and common data folders, so that the guest OS doesn't bloat up.

I had setup the folders for sharing in the VirualBox and it appears in the file system of LinuxMint, but unable to access/open it in the Guest OS.

### The Solution
The issue is the current user of Linux OS is not part of the virual box user group.  Fixing this solved the issue.

#### Command Line Way
Running this command in {% label @terminal window %} and {% label @logging off %} the current user has solved the issue.

{% codeblock %}
sudo usermod -aG vboxsf $(whoami)
{% endcodeblock %}

#### GUI Way
Search for {% label @User Settings %} and you will get the following window.  
![Linux Mint User Settings](https://res.cloudinary.com/anbuchelva/image/upload/v1546629705/images/linux-mint-user-settings.png)

Click on {% label, @Manage Groups %} button, identify {% label @vboxsf %} group.  
![Linux Mint Group Settings](https://res.cloudinary.com/anbuchelva/image/upload/v1546629705/images/linux-mint-group-settings.png)

Then click {% label, @Properties %} and select the user name which you want to have access to the shared folder.  
![Linux Mint User Group Properties](https://res.cloudinary.com/anbuchelva/image/upload/v1546629705/images/linux-mint-user-group-properties.png)

Logging off the user (if already logged in) and log in back, would solve the issue.
