---
title: Bypass Screenshot Restriction on Android
date: 2018-10-24T12:32:27.000Z
updated: 2019-09-09T17:41:00.000Z
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
thumbnailimage: "https://res.cloudinary.com/anbuchelva/image/upload/c_scale,w_250/v1579455286/images/android.png"
url: "/android/bypass-screenshot-restriction-on-android/"
---
Taking screenshots is a common activity, a normal user would do in all kind of electronic platforms.  I do not remember having restrictions in taking screenshots on Windows PC.  It used to be similar in [Android](/Android/) platform until Google introduce restrictions from taking a screenshot.
<!--more-->
Is there a way to bypass it? Yes!, there are...

1. [Root](https://en.wikipedia.org/wiki/Rooting_(Android)) your device, install [Xposed framework](https://forum.xda-developers.com/xposed/xposed-installer-versions-changelog-t2714053) - and lose warranty :stuck_out_tongue_winking_eye:
2. Cast your device to another device, such as windows PC, then take a screenshot on the PC - how complex it is?
3. **Its my way, which is the easiest one..**  
   Pressing and holding `Volume Down` and `Power Key` simultaneously would take screenshot in Android.  This won't work on the restricted apps and you would get an error notification that, 
   
{{< alert warning >}}
Taking screenshots isn't allowed by the app or your organization.
{{< /alert >}}

I'm not going to suggest any magic to take a screenshots in such cases.  Just use the _Google Assistant_ to take a screenshot. Voila! It would byepass the security and grab the screen context to you.

### Prerequisites

Make sure you have the following on your Android device.

* Your device's Android version should be Marshmallow (6.0) or above
* Google application should be there
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

.    
{{< alert info >}}

**Update:** It looks like Google has fixed this bug and I'm unable to use this option to take screenshot when there is restriction, using Android Pie and latest Google App.  It just generates a black color image, which displays only the status bar and navigation bar.

{{< /alert >}}
