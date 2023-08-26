---
title: "Collect Ather Logs in Google Sheets via Telegram Bot"
date: 2023-08-26
updated: 2023-08-26
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
I have been using the Ather 450X for last 8+ months. I like to drive the vehicle compared to the previous vehicles that have I owned.

Ather provides some statistics in the app such as last 20 rides, monthly ride logs, charging statistics, etc., But recently they stopped sending the monthly logs, so I want to collect the logs by myself for analysis purpose.
<!--more-->
<!-- toc -->
## The Purpose
I wanted to see the trend how many Km I'm driving every month, what is the expected range and whether it is increasing month over month or decreasing, etc., The monthly ride logs were useful, but there's no place where I can check all the months data in one place after Ather discontinue the logs. I need to find my previous emails to check them.

So I wanted to collect the logs by myself and include few metrics that Ather doesn't provide directly such as Batter Usave for each ride, Batter Usage per day, per month, battrey consumtpion per Km. Also I will own my data and I can check whenever I like.

## Thought Process
Initially I was thinking to collect the statistics manually using a webpage. But I felt the interest in updating the logs will be lost, if it is cumbursome.  So I wanted to take the option provided by Ather in the app for sharing the ride statistics as image for their marketing purposes(?).

Then run OCR on the image get the relevant text values and organize it in a proper manner.  So I will not lose interest in updating the logs over a period of time.

## Tools
I wanted tools to process the following steps.
1. Collect input from Ather app.
2. Process OCR and convert to data points.
3. Store the organized data in some place.
4. Setup some reports to analyze the trend and usage
5. A platform to automate all the above.
6. All I wanted to be free or cost effective

After thinking for sometime I settled with the following in the same order.
1. Collect input from Ather app - Telegram / Telegram bot
2. Process OCR and convert to data points - Google Docs
3. Store the organized data in some place - Google Sheets
4. Setup some reports to analyze the trend and usage - Google Sheets
5. A platform to automate all the above - Google Scripts
6. All I wanted to be free or cost effective - All the above are free with a certain limit

## How does it work?
- Go to Ather app and open ride statistics - The app contains 20 latest ride with information like Date and time, Distance Travelled, Time spent, Efficiency, Projected Range, Top Speed.
- Share the image to Telegram - the bot that I have created for my personal use.
- The bot sends the image to Google Drive
- A script picks the image and convert to text and data points
- A script cleanup the data and put it in a right column
- Google sheets summarizes the data and for update charts
- Telegram bot send a summary of what was extracted from the image.
- Telegram bot gives additional options to get the ride statistics as graphs.

## Setup
### Requirements
If you wish to setup the same for your personal use, you need the following.
* A google account with few MBs free space
* A Telegram account
* A PC to setup the process. It is very difficult to set up using mobile.
* Little time and patience

I'm not going to explain how to setup google and telegram accounts here.

### Setup Telegram bot
- Search for BotFather in Telegram or click this link https://t.me/BotFather
- Hit 'Start', which will give you lot of commands.
- Hit Menu from the bottom right then choose `/newbot`
- It will ask you to provdide some basic information such as your Bot's name and user name.
- There is no restriction on naming your bot.
- But when you create user name there are restrictions, no special characters, no hyphens and most importantly the user name should end with `bot`.
- Once you provide those inputs, you will get a API token like `12345678910:ABCDEfghijK..........', keep it safe and do not share it with anyone.
- Use the below image for illustration purpose. Do not use the same user name.
![Botfather](/images/ather-log/botfather.png)

{{< alert info >}}
lets call this API token as **BOT TOKEN** for time being.
{{< /alert >}}

### Setting up Google Sheets
Save this google sheet in your google drive, by clicking File > Make a copy. https://docs.google.com/spreadsheets/d/1ZsFQ73vUGeLkmdJETfWQeb_HDB673ke0xb2VEZrgZY8/
![google-sheet-make-a-copy](/images/ather-log/google-sheet-make-a-copy.png)

It will ask you to name the file and also highlight that the scripts also will be saved.
![google-sheet-make-copy-name](/images/ather-log/google-sheet-make-copy-name.png)

You can rename the sheet the way you want and click 'Make a copy'.  Once the file is saved, you will be able to make edits to the sheet.
Just go through the file and get a basic understanding.

You need to copy highlighted portion of the URL (excluding the slaches /) and keep it safe for later use.
![google-sheet-url](/images/ather-log/google-sheet-url.png)

{{< alert info >}}
lets call this portion as **Spread Sheet ID** for time being.
{{< /alert >}}

### Setting up Google Drive
Visit https://drive.google.com/ and create a new folder.
![google-drive-new-folder](/images/ather-log/google-drive-new-folder.png)

Give a name something like 'Ride Logs'. Then copy the address bar content as highlighted below and keep it safe.  We will be using it in the next step.

![google-drive-url](/images/ather-log/google-drive-url.png)

{{< alert info >}}
lets call this portion as **DRIVE ID** for time being.
{{< /alert >}}

### Setting up Script
Click 'Extensions' and 'Apps Script', it will open up a new tab. You will see a window like this.
![google-app-script-start](/images/ather-log/google-app-script-start.png)

You can rename the 'Ather Ride Log_Demo' to something similar to the name you used for the google sheet. Though it is not mandatory to rename.

You can see the 'Deploy' button on the right. Click 'Deploy' then 'New Deployment'.
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

## Usage
1. You can clear the contents from 'Data' sheet from row no.2 onwards.
2. Do not delete the titles.
3. Do not make any changes on the other sheets, unless you know what you are doing.
4. share the ride log image which comes with the scooter image to the Telegram bot, you will get a response that the image is being processed.
5. Then the script will extract the data and put it in the 'Data' sheet.
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
Some sample charts are given below:
![sample-chart-1](/images/ather-log/sample-chart-1.jpeg)
![sample-chart-2](/images/ather-log/sample-chart-2.jpeg)
![sample-chart-3](/images/ather-log/sample-chart-3.jpeg)
![sample-chart-4](/images/ather-log/sample-chart-4.jpeg)


## Important Things to Note
Few important things to note,
1. Whatever the data that comes out of the ride log image, the data would be populated.
2. If the ride log itself is incorrect, the script will not correct by itself.
3. The Average speed calculation will not match with the ride log vs. the google sheets.
4. Ather calculates the average speed by taking only the ride time, but the log shows the stop time as well.
5. All these data to be used for educational purpose only. I have tried my best to make it accurate, I hold no responsible if it is incorrect.
6. I have tested the outcome and hope no security vularabilities are present in the code. Feel free to reach-out to me, if there are any.
6. This data should not be used for any legal or other purposes.
7. I give all rights to whoever wants to modify, enhance, redistribute, sell this program.
8. I'm not expecting any monitory benefit, this is built only to support the community.

For any clarification reach out to me in this [telegram channel](https://t.me/ather_india).
I would respond when I am free; no immediate support guarandeed.
