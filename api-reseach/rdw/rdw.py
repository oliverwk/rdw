import requests

headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 14.2.0) Alamofire/4.7.3',
}

params = (
    ('subscription-key', 'cb3b64e6d34b4e02ac4a6aa0b02b4312'),
)

def latestKenteken():
    data = {"SOORT-KENT-SER": 1}
    page = requests.post("https://api.rdw.nl/ovi/latest", params=params, headers=headers, data=str(data))
    jsons = page.json()
    print(json.dumps(jsons, indent=4))

def auto(Kenteken):
    if Kenteken and "-" in Kenteken:
        data = {"KENTEKEN": Kenteken.replace("-","").upper()}
        response = requests.post('https://api.rdw.nl/ovi/version=v1', headers=headers, params=params, data=str(data))
        auto = response.json()
        auto_info = auto["OPENB-VRTG-INFO"]["VRTG-STAND-GEG"]
        print(f'Het is een {auto_info["MERK-BESCHR"]} {auto_info["TYPE-BESCHR-VTG"]} in het {auto_info["ACT-KLEUR-1"]} met {auto_info["AANT-CYL"]} cilinders en met {auto_info["AANT-ZITPL"]} zitplaatsen.')
        return auto_info
    elif Kenteken and not "-" in Kenteken:
        data = {"KENTEKEN": Kenteken.upper()}
        response = requests.post('https://api.rdw.nl/ovi/version=v1', headers=headers, params=params, data=str(data))
        auto = response.json()
        auto_info = auto["OPENB-VRTG-INFO"]["VRTG-STAND-GEG"]
        print(f'Het is een {auto_info["MERK-BESCHR"]} {auto_info["TYPE-BESCHR-VTG"]} in het {auto_info["ACT-KLEUR-1"]} met {auto_info["AANT-CYL"]} cilinders en met {auto_info["AANT-ZITPL"]} zitplaatsen.')
        return auto_info
    else:
        print("Voer een geldig kenteken in")
