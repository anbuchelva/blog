---
title: "Collect Ather Logs in Google Sheets via Telegram Bot"
date: 2023-08-26
updated: 2023-08-27
categories:
  - projects
tags:
  - ev
  - ather
  - google-sheets
  - telegram-bot
  - appscript
keywords:
  - ev
  - ather
  - google-sheets
  - telegram-bot
  - appscript
comments: true
thumbnailimage: "images/ather-log/ather-logo.webp"
TOC: true

url: "/blog/collect-ather-logs-to-google-sheets/"
---

I have been using the Ather 450X for over 8 months now. I prefer driving this vehicle more compared to my previous ones.

The Ather app provides statistics such as the last 20 rides, monthly ride logs, charging statistics, etc. However, they recently stopped sending monthly logs. To continue analyzing the data, I decided to collect the logs myself.

<!--more-->
<!--TOC-->

## Purpose
My aim was to track trends in my monthly driving distance, monitor expected range variations, and evaluate whether these metrics are increasing or decreasing over time. The monthly ride logs were helpful, but since Ather discontinued them, there's no single place to view all the monthly data. I used to rely on my previous emails to access them.

I wanted to take charge of collecting the logs, incorporate additional metrics not provided by Ather, such as Battery Usage for each ride, Daily and Monthly Battery Usage, and Battery Consumption per Kilometer. By managing my data, I can access it at my convenience.

## Thought Process
Initially, I considered manually collecting statistics using a webpage. However, I realized this could become cumbersome and might discourage me from maintaining the logs over time. I opted for the option in the Ather app to share ride statistics as images for their marketing purposes.

I planned to run Optical Character Recognition (OCR) on these images to extract relevant text values and then organize them systematically. This way, I wouldn't lose interest in maintaining the logs, as it require less work.

## Tools
I needed tools for the following steps:
1. Collect input from the Ather app.
2. Process OCR and convert to data points.
3. Store organized data.
4. Set up reports for trend analysis.
5. Automate the process.
6. Keep costs low or free.

After consideration, I settled on the following tools:
1. Collect input from Ather app: Telegram / Telegram bot.
2. Process OCR and convert to data points: Google Docs.
3. Store organized data: Google Sheets.
4. Set up trend analysis reports: Google Sheets.
5. Automate the process: Google Scripts.
6. Keep costs low or free: All tools above are free within certain limits.

## How It Works
1. Open the Ather app and access ride statistics, which includes details like Date, Distance Traveled, Time Spent, Efficiency, Projected Range, and Top Speed for the last 20 rides.
2. Share the ride statistics image with my Telegram bot.
3. The bot sends the image to Google Drive.
4. A script retrieves the image, converts it to text and data points.
5. The script organizes the data and places it in the correct columns.
6. Google Sheets summarizes the data and generates update charts.
7. The Telegram bot sends a summary of the extracted image information.
8. The Telegram bot provides options to view ride statistics as graphs.

## Setup
### Requirements
To set up a similar system for personal use, you'll need:
- A Google account.
- A Telegram account.
- A computer (setting up on a mobile device is challenging).
- Some time and patience.

### Setting up Telegram Bot
1. Search for BotFather on Telegram or use this link: [https://t.me/BotFather](https://t.me/BotFather).
2. Start a chat and choose `/newbot` from the menu.
3. Provide basic information such as Bot's name and username (naming rules apply).

![Botfather](/images/ather-log/botfather.png)

{{< alert info >}}
Refer this API Token as **BOT TOKEN**.
{{< /alert >}}

### Setting up Google Sheets
Make a copy of this Google Sheet: [Google Sheets Template](https://docs.google.com/spreadsheets/d/1ZsFQ73vUGeLkmdJETfWQeb_HDB673ke0xb2VEZrgZY8/).
![google-sheet-make-a-copy](/images/ather-log/google-sheet-make-a-copy.png)

It will ask you to name the file and also highlight that the scripts also will be saved.
![google-sheet-make-copy-name](/images/ather-log/google-sheet-make-copy-name.png)

You can rename the sheet the way you want and click 'Make a copy'.  Once the file is saved, you will be able to make edits to the sheet.


![google-sheet-url](/images/ather-log/google-sheet-url.png)

{{< alert info >}}
Note the highlighted portion of the URL as the **Spread Sheet ID**.
{{< /alert >}}

### Setting up Google Drive
Visit https://drive.google.com/ and create a new folder.
![google-drive-new-folder](/images/ather-log/google-drive-new-folder.png)

Choose a name, such as 'Ride Logs', and securely save the content from the address bar, as highlighted below. This information will be utilized in the subsequent step.
![google-drive-url](/images/ather-log/google-drive-url.png)

{{< alert info >}}
We'll refer to this section as the **DRIVE ID**
{{< /alert >}}

### Setting up Script
Access Google Apps Script via the "Extensions" menu in Google Sheets.
![google-app-script-start](/images/ather-log/google-app-script-start.png)
Rename the project to match your sheet's name (optional).
Deploy the script, authorizing necessary permissions.
![script-deploy-button](/images/ather-log/script-deploy-button.png)

You will get a pop-up like below.  Make sure you select the highlighted poritions. If you make mistakes here, your bot will not work.

![script-deploy-1st](/images/ather-log/script-deploy-1st.png)

Then you need to follow the steps as highlighted in the screenshots.
These steps are required to access your google drive, google sheets, google docs and slides, to process further.

![script-authorize-access](/images/ather-log/script-authorize-access.png)

Choose your gmail ID, if you don't want to use your primary gmail you can create a new one.
![script-authorize-gmail](/images/ather-log/script-authorize-gmail.png)

You will get a warning that the app is unverified. Click advanced
![script-authorized-advanced](/images/ather-log/script-authorized-advanced.png)

Click go to 'your google sheet file name'
![script-authorize-unsafe](/images/ather-log/script-authorize-unsafe.png)

Click Allow
![script-authorize-allow](/images/ather-log/script-authorize-allow.png)

You will get a deployment URL. Keep it safe and do not share it with anyone.
![script-deploy-copy-url](/images/ather-log/script-deploy-copy-url.png)

{{< alert info >}}
lets call this URL as **WEBHOOK** for time being.
{{< /alert >}}

{{< alert danger >}}
Do not try to deploying multiple times, if the URL changes then you need to modify few things later.
{{< /alert >}}

Now click the gear icon on the left pane, which will open up the project settings.
![script-project-settings](/images/ather-log/script-project-settings.png)

Scroll to the bottom where you can see the Script Properties, then click on 'Add Script Property' button
![script-property-button](/images/ather-log/script-property-button.png)

### Update Script Properties

{{< alert danger >}}
This portion is very important. If anything missed out, the whole process might fail.
{{< /alert >}}

Create the following Script Properties. To avoid spell error, copy and paste.

```ADMIN
ALLOWED_USER_IDS
DRIVE_FOLDER_ID
SSID
WEBHOOK_URL
bot_token
```
for time being update the `ADMIN` and `ALLOWED_USER_IDS` as `NA`.
`DRIVE_FOLDER_ID` should be updated with DRIVE ID, which we have taken from the Google Drive URL.
`SSID` should be updated with the SPREAD SHEET ID, which we have taken from the Google Sheets URL.
`WEBHOOK_URL` should be updated with the WEBHOOK, which we have got it after deploying the script.
`bot_token` should be updated with BOT TOKEN, which we have got it from BotFather.

It should look like the below picture.
![script-properties-list](/images/ather-log/script-properties-list.png)

Then click 'Save Script Properties' Button.

### Deploy it Again

The changes that we made in the script properties should be deployed again. But this time, we need to deploy a new version.

Click the 'Deploy' Button, then click 'Manage Deployments'.
![script-deploy-manage-deployments](/images/ather-log/script-deploy-manage-deployments.png)

{{< alert danger >}}
Do not click the new deployment. If you do, the webhook URL will change and it has to be reset.
{{< /alert >}}

Click on the pencil icon,on the version drop down choose 'New Version', then deploy.

{{< alert warning >}}
This step has to be done whenever we change something on the code or script properties.
{{< /alert >}}

![script-deploy-new-version](/images/ather-log/script-deploy-new-version.png)


### Setup Webhook and Get Telegram User Info
Now we need to set up the ADMIN and ALLOWED_USER_IDS, so that the bot can be accessible only to the intendented users.
For that, go to Script editor from the left pane.
![script-editor](/images/ather-log/script-editor.png)

Then go to `bot.gs` file.
You will see many functions like `getMe()`, `setWebhook()`, etc.,

from the top select `getMe` then click Run.  You will get a success message in the execution log on the bottom.
![script-run-get-me](/images/ather-log/script-run-get-me.png)

Now do the same for `setWebhook`.
![script-run-set-webhook](/images/ather-log/script-run-set-webhook.png)

Once it is done [Deploy It Again](#deploy-it-again).

{{< alert success >}}
if you are getting a result as 'ok: true' then, you have followed the steps without any mistakes.
{{< /alert >}}

Once the webhook is setup the telegram bot that we created above will start working.

Open the telegram app and open the bot that you have created. If you don't know the bot, the link would be available in BotFather.

Hit 'Start' button. You need to get a message like

{{< alert warning >}}
Hey `firstName` Thank you for the interest in using this bot........ for more information about this project. Your ID is `chatId`.
{{< /alert >}}

Note the chatID and this is going to be our `ADMIN` and `ALLOWED_USER_IDS`.

![telegram-user-not-authorized](/images/ather-log/telegram-user-not-authorized.jpeg)

Follow the steps explained in the [Update Script Properties](#update-script-properties) and fill in `ADMIN` and `ALLOWED_USER_IDS`.

So your script proprties should have the telegram numeric IDs something like this.

![script-properties-id](/images/ather-log/script-properties-id.png)

Now go back to telegram and send a message `/start`. You should be getting a welcome message.

{{< alert success >}}
You have setup this properly if you have set it up properly. If it is not working follow step [Deploy It Again](#deploy-it-again).
{{< /alert >}}


### Usage
1. You can clear the contents from 'Data' sheet from row no.2 onwards.
2. Do not delete the titles.
3. Do not make any changes on the other sheets, unless you know what you are doing.
4. Share the ride log image with the Telegram bot.
5. The script extracts and populates data in the 'Data' sheet.
![ride-log-sample](/images/ather-log/ride-log-sample.jpeg)

### Telegram bot menu
We don't get menus by default on the bot. The bottom text input box would look like this at this stage.

To enable menu and commands, touch the name of the bot.
![telegram-bottom-wo-menu](/images/ather-log/telegram-bottom-wo-menu.jpeg)

Touch the pencil icon.
![telegram-bot-edit](/images/ather-log/telegram-bot-edit.jpeg)

Touch 'Edit commands' option
![telegram-bot-edit-commands](/images/ather-log/telegram-bot-edit-commands.jpeg)

The Botfather window would open and ask for commands. Copy and paste the following.
![telegram-botfather-commands](/images/ather-log/telegram-botfather-commands.jpeg)
```
start - Initiate the bot
daily_charts - Day level stats
monthly_charts - Month level stats
```
{{< alert warning >}}
Do not make spell error, also the commands are case sensitive.
{{< /alert >}}

Once it is pasted the menu will be activated for the bot you have creaged and it will look like this.
![telegram-bottom-with-menu](/images/ather-log/telegram-bottom-with-menu.jpeg)

Choosing menu and relevant buttons will bring charts for analysis.
![telegram-charts](/images/ather-log/telegram-charts.jpeg)

### Sample Charts
Here are some sample charts:
- Distance vs. Range: ![Sample Chart 1](/images/ather-log/sample-chart-1.jpeg)
- Distance vs. Efficiency: ![Sample Chart 2](/images/ather-log/sample-chart-2.jpeg)
- Distance vs. Battery % per Km: ![Sample Chart 3](/images/ather-log/sample-chart-3.jpeg)
- Daily battery usage in %: ![Sample Chart 4](/images/ather-log/sample-chart-4.jpeg)

## Important Notes
1. The script will process data extracted from the ride log image; if the source is incorrect the result also will be incorrect.
2. Ather's average speed calculation differs from the script due to how stop time is handled. I feel the calculation on Ather's side also incorrect.
3. This data is intended for educational use only.
4. The script's security vulnerabilities were checked, but use at your own risk.
5. This data shouldn't be used for legal or official purposes.
6. The code can be modified, enhanced, redistributed, or sold.
7. The project is provided to support the community, without expectations of monetary gain.

For questions, contact me on this [Telegram channel](https://t.me/ather_india). I'll respond when available, but immediate support isn't guaranteed.
