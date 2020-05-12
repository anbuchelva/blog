---
title: Valid Intersections in Hyperion Planning
date: 2018-06-03T10:52:36.964Z
updated: 2018-06-03T10:52:36.964Z
categories:
  - Hyperion
tags:
  - hyperion planning
  - classic planning
  - forms
  - validation rules
keywords:
  - Hyperion Planning
  - Classic Planning
  - Forms
  - Validation Rules
toc: true
url: "/hyperion/valid-intersections-in-hyperion-planning/"
---
I recently encountered with a requirement that the users should input data in the Planning Forms only for Valid Intersection. There's an option to setup Valid Intersection in PBCS. But, the requirement is to setup the same on premises environment.
You ask me how to do it in Microsoft Excel using VBA or Microsoft Access using SQL Query, I would do it very easily. But in Hyperion Planning, there's no such option available inbuilt.
<!--more-->
### The Problem
There are two dimensions in a classic Planning Application having _many to many_ relationship. The user should select the correct combination in the web forms/SmartView and input the data. There should be restrictions setup for selecting/updating in incorrect combinations.	
Lets assume the application is having following dimensions.

1. Year
2. Period
3. Scenario
4. Version
5. Currency
6. Entity
7. Operating Unit
8. Business Unit

Here the Operating Unit and the Business Unit are the problem area.

### Possible Solution
Restrict user access for only the Valid Intersection. But it will overlap and create mess, if the user has access to more than one Valid Intersection.

### Solution

#### Step 1: Create 2 Account members
* Create an Account member named _Valid Intersection_ and set the member property to refer Yes/No Smart list Value
* Create a dynamic calc member and add this formula `["Current Year"] -> "BegBalance" -> ["Current Scenario"] -> ["Current Version"] -> ["Currency where the inputs to be made"] -> "No Entity"`

{{< alert info >}}
the brackets to be removed after updating the correct members.
{{< /alert >}}

#### Step 2: Setup web form to collect the right intersections.
Setup a web from by selecting the above mentioned members in the POV section and the Operating Unit / Business Unit in Rows/Columns. Account should be "Valid Intersection", which we created in step 1.
The form should be available as below:
**POV / Page** : `FY18 -> BegBalance -> Current -> Working -> Local -> No Entity`

| | BU1 | BU2 | BU3 | BUn |
|---|:---:|:---:|:---:|:---:|
|OU1| Yes | | | |
|OU2| Yes | | | |
|OU3| | Yes | | |
|OU4| | | Yes | |

The `dyn_Valid Intersection` member would give an output as 0 or 1 (yes or no) for these BU / OU irrespective of selections in the other dimensions.

#### Step 3: Include the `dyn_Valid Intersection` member in the forms and setup validation rules.
Open the form in `Edit` mode and go to `Layout` tab.
1. Add the `dyn_Valid Intersection` member in the first row of every form, where you want to set up this validation. _I'm trying to find a way to achieve the output without adding a row_
2. Select `Validation Rules` from right pane, click the `+` sign and setup a validation rule as like the screen shot  
![Hyperion Planning Form Validation Rule Setup](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546629694/images/HP/Validation_Rule1.PNG)  
2. I keep the process format in grey, as it would mimic the user that the cell is locked for editing, though it is editable. You may add a `Validation Message` which will be displayed to the users upon error.  
![Hyperion Planning Form Validation Error Message](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546629694/images/HP/Validation_Rule2.PNG)  
3. Once done, click `Validate` to validate the `Validation Rule` :wink:  
![Hyperion Planning Form Validate validation rule](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546629694/images/HP/Validation_Rule3.PNG)  
4. Now open the form to input data and select incorrect combination from the `Page` section / `drop down`. You will see all the cells are grayed out. When you try to input data in a `store` member, you will get the error message that was setup in the `Validation Rule`.  
![Hyperion Planning Validation Rule Invalid Intersections](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546629694/images/HP/Validation_Rule4.PNG)  
5. It doesn't restrict user to input on the invalid intersections. However, it just give a warning to them that they have selected invalid intersections and inputting data.

#### Step 4: Setup a Business rule to validate the intersections while saving form.
As an additional way to restrict processing calculations for the invalid intersections, we can setup a Business Rule and place it in the first position with `@Return` message.
sample code is given below:
```
FIX("FY18",{RTP_BU},{RTP_OU})
	"Valid Intersection"(
	IF("dyn_Valid Intersection" <> 1))
		@RETURN("Invalid BU x OU selected, pls select the valid BU x OU", Error);
	ENDIF)
ENDFIX
```

{{< alert info >}}
All these checks would work only for form. There's no way to restrict, if an user prefer to load data through ad-hoc smartview query or try loading through back end.
{{< /alert >}}

### Conclusion
This would be very easy (Step 3 is not needed), if Oracle provides an option to run a Business Rule while loading the form with `Run Time Prompt`. It is not supported and we need to do all these steps as workaround.
