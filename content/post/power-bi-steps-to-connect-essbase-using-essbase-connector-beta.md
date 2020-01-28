---
title: Power BI - steps to connect Essbase using Essbase Connector (beta)
date: 2018-12-20T18:13:29.393Z
updated: 2018-12-20T18:13:29.393Z
categories:
  - Hyperion
tags:
  - hyperion
  - power bi
  - essbase
keywords:
  - Essbase Connector
  - Power BI
  - Essbase
thumbnailimage: "https://res.cloudinary.com/anbuchelva/image/upload/c_scale,h_250,f_auto,q_auto/v1579969704/images/power-bi/powerbi_logo.png"
url: "Hyperion/power-bi-steps-to-connect-essbase-using-essbase-connector-beta/"
---
There is a request from the Essbase & Power BI community to provide an official connector for connecting Essbase from Power BI.  It started exactly 4 years back and Microsoft was delaying it for long time.  Finally on Nov 7, 2018 the request has been taken care and moved from **under review** to **backlog** status.

Few days back we got our first beta version of the connector as well, with a warning
<!--more-->
{{< alert warning >}}
The Essbase Connector is still under development. Please try it out and give us feedback. We can't guarantee it will work the same way in the final version. Future changes may cause your queries to be incompatible.
{{< /alert >}}

Though, I wanted to give a try.

### Essbase Connector

The connector is listed under the **Database** tab when we select **Get Data** or you may search for `Essbase` on the search box.  Selecting Essbase and clicking _connect_ would take us to the next window, which requires us to provide the **Essbase** server details.

### Essbase Server Connection String

Since Microsoft did not provide any official document on connecting Essbase through power BI, I have tried multiple ways to connect; but almost everything failed, except one.  The connecting parameter should look like this:

```
http://hostname:port/aps/XMLA
```

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546937989/images/power-bi/powerbi-essbaseconnector1.png)

The server name & port number to be modified as per your environment.

Clicking _OK_ would take us to the basic login screen, where we need to provide the login credentials of the Essbase server.

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546937989/images/power-bi/powerbi-essbaseconnector2.png)

### Navigator

The Navigator screen displays the list of applications available in the server. Expanding an application displays the plan types in a format of `application name.plantype`.  

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546937989/images/power-bi/powerbi-essbaseconnector3.png)

Expanding further, displays the list of members from `Account Hierarchy` in improper order. Microsoft might need to fix it to display in a proper order / hierarchy way.

### Designing Report / Dashboard
Selecting the required Account codes and required dimensions from the list provide us the fields to design report in hierarchical order.

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/f_auto,q_auto/v1546937989/images/power-bi/powerbi-essbaseconnector5.png)

{{< alert info >}} **Update:**
The next [post]({{< relref "power-bi-and-essbase-initial-experiments.md" >}}) explains further about Power BI - Essbase Connector.
{{< /alert >}}