---
title: Common Connection Name in Smartview Functions
date: 2018-08-31T14:37:00.000Z
updated: 2018-08-31T14:37:00.000Z
categories:
  - Hyperion
tags:
  - essbase
  - HP
  - HFM
  - smartview
  - WSFN
keywords:
  - hyperion planning
  - hyperion essbase
  - hyperion financial management
  - smartview
  - WSFN
  - HSGet
  - HSSet
toc: true
url: "/Hyperion/common-connection-name-in-smartview-functions/"
---
Another big gap from the previous post.  I was being busy in the budgetting acitivities (which started in last Mar), as usual there were many change requests, allocation logic changes, etc., occupied most of my time.  The budget is officially over and 2 forecast cycles are passed. So, I am free for sometime.

Just wanted to share my experience, while setting up the inbuilt functions/formulas using SmartView.
<!--more-->
### The Process
We built few SmartView Templates using `HSGetValue`, `HSSetValue`, etc.,  The users just refresh the worksheets, they get the custom reports very easily. We advised them to create private connections before setting up any such functions. The private connections are being used as `ConnectionName` filed.

### The Problem
1. Each user started using the `Private Connection Name` for their convenient, start preparing their own templates
2. When they share their workings to other user, it won't work as the `ConnectionName` is different
3. When they login to another PC / get a laptop replacement, they need to setup the connection name again
4. There were many queries arose and we were asked to support

### Possible Solution
Prepare a list of `ConnectionName` for each application and share with the users, so that all the users will use the same name for private connections.  
The problem is to educate the users and make them to follow it, when the user base is bit high.

### The Solution
Setup a global `ConnectionName` which is common for all the users and doesn't use the `Private Connection` name.  The provision was already given by Oracle. The Syntex is given below:
```
WSFN|ProviderType|Server|Application|Database
```
each of the field is broken by pipeline symbol, without any spaces.  
This `ConnectionName` can be used in **Essbase**, **Hyperion Planning** and **Hyperion Financial Management** by changing the `Provider Type` field.

Example syntex for each of them:
#### Essbase:
```
WSFN|Essbase|Essbasecluster-1|Sample|Basic
```

#### Hyperion Planning (HP)
```
WSFN|HP|localhost|Samplan|BudPlan
```

#### Hyperion Financial Management (HFM)
```
WSFN|HFM|localhost|HFMApp|HFMApp
```

This can be stored in an excel cell and referred for the each formula you make.  This connection name would be common for all the users; no issues while sharing the workings, changing PC/Laptop, etc.,
