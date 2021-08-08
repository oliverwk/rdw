#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
data = {"KENTEKEN": "31SNZ2"}
headers={'Content-Type':'application/json','User-Agent':'RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 13.6.0) Alamofire/4.7.3'}

page = requests.post('https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312', data=data, headers=headers)
print(page.content)


"""
2020-08-10 12:47:24 POST https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312
                         ← 200 OK application/json 2.87k 464ms
                              Request                                                             Response                                                            Detail
Host:             api.rdw.nl
Content-Type:     application/json
Connection:       keep-alive
Accept:           */*
User-Agent:       RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 13.6.0) Alamofire/4.7.3
Accept-Language:  en-NL;q=1.0, nl-NL;q=0.9, en-GB;q=0.8
Content-Length:   21
Accept-Encoding:  gzip;q=1.0, compress;q=0.5
JSON                                                                                                                                                                                              [m:auto]
{
    "KENTEKEN": "31SNZ2"
}



Flow Details
2020-09-11 07:33:15 POST https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312
                         ← 200 OK application/json 2.87k 232ms
                              Request                                                             Response                                                            Detail
Host:             api.rdw.nl
Content-Type:     application/json
Connection:       keep-alive
Accept:           */*
User-Agent:       RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 13.6.1) Alamofire/4.7.3
Accept-Language:  en-NL;q=1.0, nl-NL;q=0.9, en-GB;q=0.8
Content-Length:   21
Accept-Encoding:  gzip;q=1.0, compress;q=0.5
JSON                                                                                                                                                                                              [m:auto]
{
    "KENTEKEN": "31SNZ2"
}


"""
