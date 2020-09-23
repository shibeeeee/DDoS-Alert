import requests
webhook = 'https://discordapp.com/api/webhooks/' 
data = {
    "content": "```diff\n- Being DDoSed [Per 1 Min]```"
}
requests.post(webhook, data=data)
