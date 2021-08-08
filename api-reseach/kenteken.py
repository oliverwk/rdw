import requests

headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 14.2.0) Alamofire/4.7.3',
}

params = (
    ('subscription-key', 'cb3b64e6d34b4e02ac4a6aa0b02b4312'),
)

Kenteken = input("Voer een kenteken in: ")

if "-" in Kenteken and Kenteken:
    data = {"KENTEKEN": Kenteken.replace("-","").upper()}
    response = requests.post('https://api.rdw.nl/ovi/version=v1', headers=headers, params=params, data=str(data))
    auto = response.json()
    auto_info = auto["OPENB-VRTG-INFO"]["VRTG-STAND-GEG"]
    print(f'Het is een {auto_info["MERK-BESCHR"]} {auto_info["TYPE-BESCHR-VTG"]} in het {auto_info["ACT-KLEUR-1"]} met {auto_info["AANT-CYL"]} cilinders en met {auto_info["AANT-ZITPL"]} zitplaatsen.')
    #print(response.text)
elif Kenteken and "-" in Kenteken != True:
    data = {"KENTEKEN": Kenteken.upper()}
    response = requests.post('https://api.rdw.nl/ovi/version=v1', headers=headers, params=params, data=str(data))
    auto = response.json()
    #print(response.text)
    auto_info = auto["OPENB-VRTG-INFO"]["VRTG-STAND-GEG"]
    print(f'Het is een {auto_info["MERK-BESCHR"]} {auto_info["TYPE-BESCHR-VTG"]} in het {auto_info["ACT-KLEUR-1"]} met {auto_info["AANT-CYL"]} cilinders en met {auto_info["AANT-ZITPL"]} zitplaatsen.')
else:
    print("Voer een goed kenteken in: ")
