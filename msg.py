import requests
webhook = 'https://discordapp.com/api/webhooks/' 
data = {
    "content": "```diff\n- Wolfie is Being DDoSed By A Skid [Per 1 Min]```"
}
requests.post(webhook, data=data)