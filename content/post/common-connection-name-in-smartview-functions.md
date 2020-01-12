---
title: Common Connection Name in Smartview Functions
date: 2018-08-31T14:37:00.000Z
updated: 2018-08-31T14:37:00.000Z
categories:
  - Hyperion
tags:
  - hyperion planning
  - hyperion essbase
  - hyperion financial management
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
---
Another big gap from the previous post.  I was being busy in the budgetting acitivities (which started in last Mar), as usual there were many change requests, allocation logic changes, etc., occupied most of my time.  The budget is officially over and 2 forecast cycles are passed. So, I am free for sometime.

Just wanted to share my experience, while setting up the inbuilt functions/formulas using SmartView.
<!---more--->
### The Process
We built few SmartView Templates using {% label @HSGetValue %}, {% label @HSSetValue %}, etc.,  The users just refresh the worksheets, they get the custom reports very easily. We advised them to create private connections before setting up any such functions. The private connections are being used as {% label @ConnectionName %} filed.

### The Problem
1. Each user started using the {% label @Private Connection Name %} for their convenient, start preparing their own templates
2. When they share their workings to other user, it won't work as the {% label @ConnectionName %} is different
3. When they login to another PC / get a laptop replacement, they need to setup the connection name again
4. There were many queries arose and we were asked to support

### Possible Solution
Prepare a list of {% label @ConnectionName %} for each application and share with the users, so that all the users will use the same name for private connections.  
The problem is to educate the users and make them to follow it, when the user base is bit high.

### The Solution
Setup a global {% label @ConnectionName %} which is common for all the users and doesn't use the {% label @Private Connection %} name.  The provision was already given by Oracle. The Syntex is given below:
{% codeblock %}
WSFN|ProviderType|Server|Application|Database
{% endcodeblock %}
each of the field is broken by pipeline symbol, without any spaces.  
This {% label @ConnectionName %} can be used in __Essbase__, __Hyperion Planning__ and __Hyperion Financial Management__ by changing the {% label @Provider Type %} field.

Example syntex for each of them:
#### Essbase:
{% codeblock %}
WSFN|Essbase|Essbasecluster-1|Sample|Basic
{% endcodeblock %}

#### Hyperion Planning (HP)
{% codeblock %}
WSFN|HP|localhost|Samplan|BudPlan
{% endcodeblock %}

#### Hyperion Financial Management (HFM)
{% codeblock %}
WSFN|HFM|localhost|HFMApp|HFMApp
{% endcodeblock %}

This can be stored in an excel cell and referred for the each formula you make.  This connection name would be common for all the users; no issues while sharing the workings, changing PC/Laptop, etc.,
