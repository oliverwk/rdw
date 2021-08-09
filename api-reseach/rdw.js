let JSSoup = require('jssoup').default;
const fetch = require('node-fetch');
fetch("https://ovi.rdw.nl/", {
    "headers": {
      "accept": "text/html, */*; q=0.01",
      "accept-language": "nl-NL,nl;q=0.9,en-US;q=0.8,en;q=0.7",
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
      "sec-fetch-dest": "empty",
      "sec-fetch-mode": "cors",
      "sec-fetch-site": "same-origin",
      "x-requested-with": "XMLHttpRequest",
      "cookie": "ASP.NET_SessionId=5ydd4o4zoluvvxkqkbrttsnv; rdw-persist=!lUEn6uvqFJgcszyW5/spYcFGPNu8GhS1pCDT7t3s+QWZyWuuiGFDeyytv+UgiJkNa7JuKIJjxV9q490SfscBGWdW0IChdrAH9LzEQJunjw==; f5avraaaaaaaaaaaaaaaa_session_=MNMPNBIBACEOOLACIOLPKHJKCBHGGELFLJBNMFJDMMPLHENOHIHBOGCEBFAGCOMAHAKDNMINFMBDLFENDAMANHFPMFEKCEGMEPPBEJEAFDMMHJHMKLKJCNNEDOKFMHMG; TS011f44e9=01a5d145de5b790e4442a85d6c4ef3c3b8bcc463b1a85cb2a079fa75bd7bede9686e368c14540b2dd926775b73560a425e1924bc5dc7c873b861c9e984b03ef4ef947a2b3e737fe36b607f2c0fd2b793a19ce9e6fa345620d096bd7335fb9404e2b01aa001; _ga=GA1.3.1567136690.1596611859; _gid=GA1.3.464048628.1596611859; _gat_UA-123561920-5=1"
    },
    "body": `__VIEWSTATE=%2FwEPDwUKMTE1NDI3MDEyOQ9kFgJmD2QWAgIDD2QWAgIBD2QWAgIJDxYCHgdWaXNpYmxlaGRkbswJ9j6e1dGi3igmthIyvj8gc4WH7JTnjgF14yLn50Y%3D&__VIEWSTATEGENERATOR=CA0B0334&__EVENTVALIDATION=%2FwEdAAK8JKqL%2BRK4NWrMB2xu8rTB851Fq81QBiZgFEttEk2eeHewUOoCJ2ceZf9ZQoBBMXI2OTBKyEO6GXbPjhMnQTm0&ctl00%24TopContent%24txtKenteken=${process.env["KENTEKEN"]}`,
    "method": "POST",
    "mode": "cors"
  }).then(res => res.text().then(res => hadany(res)))
  .then(res => console.log(res))
.catch(err => console.log("hij ging fout", err));

function hadan(res) {
  var soup = new JSSoup(res);
  let merk = soup.find("div", class_="ui-block-a")
  console.log("het is een ", merk.find("h3").text);
  console.log("En het model is ", merk.find("p").text);
    }
  function hadany(res) {
    var soup = new JSSoup(res);
    if (soup.find("div", class_="text-red")) {
      let fout_melding = soup.find("div", class_="text-red").text
      return fout_melding;
    }
    else {
      let merk = soup.find("div", class_="ui-block-a")
      console.log("het is een ", merk.find("h3").text);
      console.log("En het model is ", merk.find("p").text);
      return "het is een ", merk.find("h3").text, "En het model is ", merk.find("p").text;
    }
  }
