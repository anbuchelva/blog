---
title: Power BI - steps to connect Essbase using Essbase Connector (beta)
date: 2018-12-20T18:13:29.393Z
updated: 2018-12-20T18:13:29.393Z
category:
  - Hyperion
tags:
  - hyperion
  - power bi
  - essbase
keywords:
  - Essbase Connector
  - Power BI
  - Essbase
---
There is a request from the Essbase & Power BI community to provide an official connector for connecting Essbase from Power BI.  It started exactly 4 years back and Microsoft was delaying it for long time.  Finally on Nov 7, 2018 the request has been taken care and moved from **under review** to **backlog** status.

Few days back we got our first beta version of the connector as well,

{% note warning %}
**With a Warning!**
The Essbase Connector is still under development. Please try it out and give us feedback. We can't guarantee it will work the same way in the final version. Future changes may cause your queries to be incompatible.
{% endnote %}
Though, I wanted to give a try.

<!---more--->

### Essbase Connector

The connector is listed under the **Database** tab when we select **Get Data** or you may search for {% label @Essbase %} on the search box.  Selecting Essbase and clicking _connect_ would take us to the next window, which requires us to provide the **Essbase** server details.

### Essbase Server Connection String

Since Microsoft did not provide any official document on connecting Essbase through power BI, I have tried multiple ways to connect; but almost everything failed, except one.  The connecting parameter should look like this:

{% codeblock %}
http://localhost:19000/aps/XMLA
{% endcodeblock %}

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/v1546937989/images/power-bi/powerbi-essbaseconnector1.png)

The server name & port number to be modified as per your environment.

Clicking _OK_ would take us to the basic login screen, where we need to provide the login credentials of the Essbase server.

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/v1546937989/images/power-bi/powerbi-essbaseconnector2.png)

### Navigator

The Navigator screen displays the list of applications available in the server. Expanding an application displays the plan types in a format of {% label @application name.plantype %}.  

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/v1546937989/images/power-bi/powerbi-essbaseconnector3.png)

Expanding further, displays the list of members from {% label @Account Hierarchy %} in improper order. Microsoft might need to fix it to display in a proper order / hierarchy way.

### Designing Report / Dashboard
Selecting the required Account codes and required dimensions from the list provide us the fields to design report in hierarchical order.

![Power BI Essbase Connector](https://res.cloudinary.com/anbuchelva/image/upload/v1546937989/images/power-bi/powerbi-essbaseconnector5.png)

{% note info %} **Update**
The next post: {% post_link power-bi-and-essbase-initial-experiments %} explains further about Power BI - Essbase Connector.
{% endnote %}