---
draft: true
date: 2020-10-01T20:18:20+05:30
showPagination: true
showSocial: true
showActions: true
comments: true
title: Experiment with Oracle Cloud
author: Anbuselvan Palaniyandi
categories: []
coverImage: ''
coverMeta: out
thumbnailimage: ''
tags:
- oracle
- " cloud"
- pi-hole
- nextcloud
- wireguard
showTags: true
keywords:
- pi-hole
- oracle-cloud
- nextcloud
- wireguard
gallery: []
summary: ''

---
After joining Standard Chartered Bank, life was not the same as before.  There's always work, even after we start working from home. Every other people I meet online during quarantine prepare watchlist in Netflix and Amazon Prime, I struggle to get time to learn something new. So, I took a week off and stayed away completely from work except few phone calls.  This post is about the week my experiments with Oracle Cloud and few personal projects.

<!-- more -->
  
### Major Topics on my Experiments
1. Oracle Cloud and use
2. Wireguard - a fast modern & secure VPN tunnel
3. Pi-hole - A black hole for Internet advertisements
4. Nextcloud - A personal cloud service

### Topics in Detail

#### Oracle Cloud
There are many cloud service available in the market. Amazon AWS, Microsoft Azure, Google Cloud are leading the market.  Oracle is late in the game and  offering better options for free of cost compared to others.  They offer 30 days trial period with 400 SGD worth of services. There is [always free tier](https://docs.cloud.oracle.com/en-us/iaas/Content/FreeTier/resourceref.htm#Details_of_the_Always_Free_Resources) covered here. 

The always free tier consists of the following.

* Compute Engine (up to two instances)
* Autonomous Database (up to two database instances)
* Load Balancing (one load balancer)
* Block Volume (up to 100 GB total storage)
* Object Storage (up to 20 GiB)
* Vault (up to 20 keys and up to 150 secrets)

I have not any tried any of the above except the Compute Engine.  The configuration of the compute engine is given below

* 100 GB storage for 2 instances.
* 1 GB memory (RAM)
* 1 Virtual CPU
* One Public IP address per instance
* Up to 10 TB data transfer, _yeah that's huge_.
* Up to 480 Mbps network speed, _which is relatively slow for a server_.

{{< alert info >}}
This doesn't support heavy computing like building Android ROMs.  But it is very helpful to run a small web server and things that can be done using a Rasperry-PI or a decade old computer.
{{< /alert >}}

#### Wireguard VPN

I wanted to have a personal VPN server for a long time.  I have no intentention of doing unlawful stuff; but to keep myself away from prying eyes.  In order to use wireguard, I need a Virtual Private Server.  There are some cloud service providers (E.g., Digital Ocean, Scaleaway, etc.,) offers VPS for ~ $5 per month. The monthly mobile network charge is ~$5 (Rs.365 on today's rate) per connection in India. Should I spend another Rs.365 per month for privacy?

Here the Oracle Cloud helps to build a [Wireguard VPN](https://www.wireguard.com/) server for free of cost.

Setting up wireguard is simple and it is more secure than the other VPN technology available currently.

{{< alert info >}}
I could use some paid VPN services, if I wanted privacy.  But, the private VPN services do more harm than being without a VPN. They just collect all the data and sell it outside.  If someone says there's a free VPN, it's not! **You are paying their bills by sharing your data**.
{{< /alert >}}


#### Pi-hole

It was a surprise that I found [pi-hole](https://pi-hole.net/) when I was getting into the steps for setting up wireguard.  Pi-hole supports blocking network wide advertisements and unnecessary trackers. They call it as _"A black hole for Internet advertisements"_.

The installation is simple and their web-interface is very good to get the statistics for maintenance.

#### Nextcloud

We all have a gmail account and by default we use Google's cloud storage service 'Google Drive', some might use Microsoft's One Drive, Dropbox or Box etc., We get 5 GB to 20 GB storage with the price of privacy.  Google Photos backup all your photos in low resolution to build their AI.  It has no help, if you want to use any of your photo and make a print, the quality dips.

[Nextcloud](https://nextcloud.com/) is an opensource software to setup your own cloud, with zero compromise on privacy.  It can be hosted locally with a small set of hardware (Rasperry-PI may be?) with additional data storage drives.  It can be hosted online, but need to pay for the servers.