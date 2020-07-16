---
title: Bypass Screenshot Restriction on Android
date: 2018-10-24T12:32:27.000Z
lastmod: 2020-07-16
categories:
  - android
tags:
  - android
  - hacks
keywords:
  - Take Screenshot Android
  - non root
  - without xposed
comments: true
thumbnailimage: "https://res.cloudinary.com/anbuchelva/image/upload/c_scale,w_250,f_auto,q_auto/v1579455286/images/android.png"
url: "/android/bypass-screenshot-restriction-on-android/"
TOC: true
showMeta: true
---
Taking screenshots is a common activity, a normal user would do in all kind of electronic platforms.  I do not remember having restrictions in taking screenshots on Windows PC.  It used to be similar in [Android](/categories/android/) platform until Google introduce restrictions from taking a screenshot.
<!--more-->

{{< alert info >}}
**Update (on 16th Jul 2020) :** I wanted to update this post for a long time, since the option suggested earlier is no longer works and I feel bad when many people visit this page by expecting to get a solution.  The options are less now, try if it works for you.
{{< /alert >}}
<!-- toc -->
There are two options I would suggest at this date (16th Jul 2020) to byepass the screenthot.

## 1. Root & Magisk Way

{{< alert warning >}}
**Warning:** I'm not responsible if you brick your device using the root method.  Rooting and modding your device may cause concequences that are unexpected. You should know what you are doing.  
If you don't know what is root and magisk, better try the [option 2](#2-the-older-and-simpler-method).  This option is for the people who mod(ify) the android operating system as they wish. Not for noobs!
{{< /alert >}}



### Prerequisites
* You will need device that has unlocked bootloader / rooted with magisk.
* You will need windows PC with 3+ GB RAM
* PC should have .Net Framework 4.7 or later installed
* PC should Jave installed
* Android Marshmallow (6.0) or later versions to be used.
* Some knowlege on flashing / modding android device

### Process

The detailed process is explained in [XDA-Developers](https://forum.xda-developers.com/apps/magisk/module-smali-patcher-0-7-t3680053) forum, but I would like to give a small overview here.

* Backup your data, this may result surprises. So, backup your device data first.
* Enable Developer settings, enable USB debugging then connect via USB cable to your PC.
* Authorize connection
* Run "SmaliPatcher.exe", First startup will automatically download the latest necessary binary's.
* Select secure flag patch - this will bypass the screenshot restriction
* Click on "ADB PATCH" button (no need to browse .jar file).
* Once the process has completed, magisk module will be generated in the same directory as "SmaliPatcher.exe" named: `SmaliPatcherModule-X.X.X.X-fOmey@XDA.zip`.
* Copy the magisk module to your device and flash it from recovery such as TWRP
* Reboot & Enable smali patcher module in magisk.


There are more modules available in the smarlipatcher, if you need you can use them as well. But remember this option requires more knowledge in modding devices and not for all the people.

--- 

## 2. The Older and Simpler Method!

{{< alert danger >}}

**Note:** This option was suggested in 2018, which may not work on the newer devices / newer versions of Android / newer versions of Google app.  
{{< /alert >}}

Instruct Google app to take screenshot. It's that simple.  

### Prerequisites

Make sure you have the following on your Android device.

* Your device's Android version should be Marshmallow (6.0) to Pie (9.0)
* Google App
* Option to trigger Google Assistant (either press and hold home button & 'OK Google' by voice)
* Enable the option to read screen context (available in Google App > More > Settings > Settings > Phone > Use screen context)

### Process

* Just open the app that has restrictions in taking screenshot.
* Say 'OK Google' or press & hold the Home button, which will trigger the Google Assistant.
* Say `Take Screenshot`, which will take the screenshot of the app that has restrictions. You can share it via other applications or save in the storage.

That's all!! This would **NOT** require rooting, installing any unknown applications on your phone. It would work untill Google fixes this _bug_!

### Video Explanation

I have made a video, to explain the same using **Telegram Secret Chat** feature.  You may apply the same in snapchat, UTS app, etc.,

{{< youtube LG9duUJ9SKg >}}

