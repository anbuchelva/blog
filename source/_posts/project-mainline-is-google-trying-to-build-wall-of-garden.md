---
title: Project Mainline - Is Google trying to build Wall of Garden?
date: 2019-10-13T05:55:04.086Z
updated: 2019-10-13T06:42:19.491Z
category:
  - android
tags:
  - Android 10
  - thoughts
keywords:
  - Android 10
  - Android Q
  - Project Mainline
comments: true
---
Google introduced Project Mainline starting from Android 10.  Google claims that project mainline benefits users on 3 components.

1. Security
2. Privacy
3. Consistency

The simple way to explain Project Mainline is to push Android Security Updates through Google Play store, instead of android updates.

More information on Project Mainline is available at [Android Developer's Blog](https://android-developers.googleblog.com/2019/05/fresher-os-with-projects-treble-and-mainline.html)

<!--more-->

Its good to get security updates directly from google rather than from the OEMs who don't provide updates frequently (there are few exceptions like Essential) and keep the users vulnerable on published exploits.

### Why OEMs don't update their devices frequently?

There are reasons why the OEMs don't provide security updates frequently.

* **Device sold in less numbers than expected.** E.g., Xiaomi Mi4i - all the Xiaomi devices were provided frequent updates and at least 1 major android version update. But this one was left with lollipop version.
* **Less support from chip manufacturers.** E.g., Redmi Note 4 (Chinese version) vs. Redmi Note 4 (Global/Indian Version) - The Chinese version contains Mediatek and Global version contains Snapdragon as SoC. The Chinese version released with Marshmallow and ended with the same version, whereas the Global version launched with Marshmallow and Updated till Pie; which is 3 major updates received for the device.
* **Skins.** Most of the OEMs release their phone with heavily modified skins, which require additional time and effort to release an update. E.g., Xiaomi's MIUI, Samsung's OneUI, Oppo's ColorOS, etc.,
* **More Devices less updates.** The OEMs sells different variant of devices to cover the higher end to lower end markets, which makes them difficult to release updates for each of the model. The companies that release less variants makes the updates faster. E.g., Pixel, Essential, OnePlus.
* **Kill support for old devices to force users to buy new devices.** What happens if the OEMs provide support for 5+ years old devices? An average user would use the device until it became dead. Most of the OEMs abandon support for the older devices and provide support ~2 years. Exceptions: OnePlus, Xiaomi.

### How to overcome this issue?

So after all these, how we can use a device if it is more than 2 years old and keep up to date with security updates?

* Buy a device which has good developer support, E.g., Pixel, OnePlus, Essential, Xiaomi phones, Asus and Oppo are tyring to join this list now, by donating devices to developers to support.
* Switch to custom roms such as Lineage OS, once the OEM stop supporting the device. Users get at updates at least once in a month, if the device has good developer support.
* Make use of your phone's full potential.

### What is with Project Mainline?

The title and all these above seems irrelevant to the topic. Isn't it? No; there's a link.

Installing Custom ROMs have 2 or more components.

1. Installing ROM
2. Installing GAPPS
3. Magisk or other mods

If an user doesn't want to be tracked by Google, they just skip the 2nd option.  But the updates are released through Google Play Store, instead of Google's Android's distribution method - the uers who do not uses Google Play Services will be left with vulnarablities.

Android Developer's blog says

> Mainline components are still open sourced.

We are not sure, when it will become closed and opened only to the OEMs; its not sure how the open source projects will get updates.


So my doubts are that,

{% note warning %}
Google is trying to build a big **Big Wall of Gargen**, so the users can get everything inside their eco system and not allowing the users to go out.
{% endnote %}

It will be difficult for others to fork android and live without Google's products. Users will have left with two options

1. Get Google Play Services, if you want updates
2. Left with vulnarablities, if you don't want Google Play Services.

We have to wait and see how it goes.

{% note info %}
I'm not an android developer and I use android phones extensively. All these information shared here are my thoughts.
{% endnote %}
