import os
os.system('clear')
import requests, json
data = {"SOORT-KENT-SER": 1}
URL = "https://api.rdw.nl/ovi/latest?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312"
headers = {'User-Agent': 'RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 13.6.0) Alamofire/4.7.3', 'Content-Type' : 'application/json'}
page = requests.post(URL, headers=headers, data=str(data))
jsons = page.json()
print(json.dumps(jsons, indent=4))
