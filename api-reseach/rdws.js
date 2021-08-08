const fetch = require('node-fetch');
async function main() {
        const data = {"KENTEKEN": "31SNZ2"}
        const ressing = await fetch('https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312',{method : "POST",  body: data, headers: {'Content-Type':'application/json','User-Agent':'RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 13.6.0) Alamofire/4.7.3'}})
        let res = await ressing.json()
        console.log(res);
        for (var i = 0; i < res["Items"].length; i++) {
          console.log( res["Items"][i]["Omschrijving"]);
        }

}
main()
const bulshit =`Flow Details
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

`
