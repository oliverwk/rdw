#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
os.system('clear')
import sys
from bs4 import BeautifulSoup
import requests


if len(sys.argv) == 1:
  kenteken = "21-snz-3"
elif sys.argv[1] == 'volvo':
  kenteken = "21-SNZ-3"
elif sys.argv[1] == 'renault':
  kenteken = ""
else :
  kenteken = sys.argv[1]

headers = {
    'authority': 'ovi.rdw.nl',
    'accept': 'text/html, */*; q=0.01',
    'x-requested-with': 'XMLHttpRequest',
    'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36',
    'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
    'origin': 'https://ovi.rdw.nl',
    'sec-fetch-site': 'same-origin',
    'sec-fetch-mode': 'cors',
    'sec-fetch-dest': 'empty',
    'referer': 'https://ovi.rdw.nl/',
    'accept-language': 'nl-NL,nl;q=0.9,en-US;q=0.8,en;q=0.7',
    '$cookie': 'ASP.NET_SessionId=51mzz4dioadyxqtgmexbckep; rdw-persist=\\u0021jkroQeZBF2fKDl6W5/spYcFGPNu8GnDZ5MWVW1YkRi/aG4T/eFWhTkLZm0ZlX8RLArbIBAAc2UlF6tpaIb7k2n9xXE736y9XvJgJYXu+qQ==; f5avraaaaaaaaaaaaaaaa_session_=DCPBPNGMHMMGFDAFGEHJKFOJMBHKOEDNAFAKJDMLLIAOIBLIBPMFDKKEBOABIMNLGNIDEABLOJEOFKCPJHJAHGJDKKPDHLCDGHLPKHLGALEIMPPIAPLDJGILFINNEKBM; TS011f44e9=01a5d145de301b7405b2208d0d4254e0744ff471408bee22b7c8351eaa7ad087d70a84b7e456281cfdceb8644f93287058d26a3f9f10f312a1ec998dae6309b19a930d536ca2bd733ab799426a6873aae5a308129e2056e8e4a78142b6177719397cfbefafff5921121e7e81f5e2c8dafabbcdc9cc403328144c5aac8fd0940725eaaccf2b; f5avr1881096869aaaaaaaaaaaaaaaa_cspm_=PDPIDGCMPECPELKKCLLHKLJFCHODAFOHICFIPOEFLBDDHLNIJHMJMOGEPLCNAIBGKNHCDENMDPLEKLPFCNBAJHBLALFLOACJLPHLNOLAALEHGCCDOFKFFNEFEMBEFDIB',
}

data = {
  '__VIEWSTATE': '/wEPDwUKMTE1NDI3MDEyOQ9kFgJmD2QWAgIDD2QWAgIBD2QWAgIJDxYCHgdWaXNpYmxlaGRkbswJ9j6e1dGi3igmthIyvj8gc4WH7JTnjgF14yLn50Y=',
  '__VIEWSTATEGENERATOR': 'CA0B0334',
  '__EVENTVALIDATION': '/wEdAAK8JKqL+RK4NWrMB2xu8rTB851Fq81QBiZgFEttEk2eeHewUOoCJ2ceZf9ZQoBBMXI2OTBKyEO6GXbPjhMnQTm0',
  'ctl00$TopContent$txtKenteken': kenteken
}

page = requests.post('https://ovi.rdw.nl/', headers=headers, data=data)
soup = BeautifulSoup(page.content, 'html.parser')


merk = soup.find("div", class_="ui-block-a")

print("het is een ", str(merk.find("h3").get_text()))

print("En het model is ", str(merk.find("p").get_text()))






import os
os.system('clear')
import sys
from bs4 import BeautifulSoup
import requests


if len(sys.argv) == 1:
  kenteken = "21-snz-3"
elif sys.argv[1] == 'volvo':
  kenteken = "21-SNZ-3"
elif sys.argv[1] == 'renault':
  kenteken = ""
else :
  kenteken = sys.argv[1]


data = {
  '__VIEWSTATE': '/wEPDwUKMTE1NDI3MDEyOQ9kFgJmD2QWAgIDD2QWAgIBD2QWAgIJDxYCHgdWaXNpYmxlaGRkbswJ9j6e1dGi3igmthIyvj8gc4WH7JTnjgF14yLn50Y=',
  '__VIEWSTATEGENERATOR': 'CA0B0334',
  '__EVENTVALIDATION': '/wEdAAK8JKqL+RK4NWrMB2xu8rTB851Fq81QBiZgFEttEk2eeHewUOoCJ2ceZf9ZQoBBMXI2OTBKyEO6GXbPjhMnQTm0',
  'ctl00$TopContent$txtKenteken': kenteken
}

page = requests.post('https://ovi.rdw.nl/', data=data)
soup = BeautifulSoup(page.content, 'html.parser')


merk = soup.find("div", class_="ui-block-a")

print("het is een ", str(merk.find("h3").get_text()))

print("En het model is ", str(merk.find("p").get_text()))
