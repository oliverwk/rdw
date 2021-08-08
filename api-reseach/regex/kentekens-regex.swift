func isMatches(_ regex: String, _ string: String) -> Bool {
    do {
        let regex = try NSRegularExpression(pattern: regex)

        let matches = regex.matches(in: string, range: NSRange(location: 0, length: string.characteNSRegularExpression(.count))
        return matches.count != 0
    } catch {
        print("Something went wrong! Error: \(error.localizedDescription)")
    }

    return false
}

var ekns: [NSRegularExpression] = [NSRegularExpression("^[a-zA-Z]{2}-[\d]{2}-[\d]{2}$"), // 0 XX-99-99
NSRegularExpression("^[\d]{2}-[\d]{2}-[a-zA-Z]{2}$"), // 1 99-99-XX
NSRegularExpression("^[\d]{2}-[a-zA-Z]{2}-[\d]{2}$"), // 2 99-XX-99
NSRegularExpression("^[a-zA-Z]{2}-[\d]{2}-[a-zA-Z]{2}$"), // 3 XX-99-XX
NSRegularExpression("^[a-zA-Z]{2}-[a-zA-Z]{2}-[\d]{2}$"), // 4 XX-XX-99
NSRegularExpression("^[\d]{2}-[a-zA-Z]{2}-[a-zA-Z]{2}$"), // 5 99-XX-XX
NSRegularExpression("^[\d]{2}-[a-zA-Z]{3}-[\d]{1}$"), // 6 99-XXX-9
NSRegularExpression("^[\d]{1}-[a-zA-Z]{3}-[\d]{2}$"), // 7 9-XXX-99
NSRegularExpression("^[a-zA-Z]{2}-[\d]{3}-[a-zA-Z]{1}$"), // 8 XX-999-X
NSRegularExpression("^[a-zA-Z]{1}-[\d]{3}-[a-zA-Z]{2}$"), // 9 X-999-XX
NSRegularExpression("^[a-zA-Z]{3}-[\d]{2}-[a-zA-Z]{1}$"), // 10 XXX-99-X
NSRegularExpression("^[a-zA-Z]{1}-[\d]{2}-[a-zA-Z]{3}$"), // 11 X-99-XXX
NSRegularExpression("^[\d]{1}-[a-zA-Z]{2}-[\d]{3}$"), // 12 9-XX-999
NSRegularExpression("^[\d]{3}-[a-zA-Z]{2}-[\d]{1}$"), // 13 999-XX-9
NSRegularExpression("^C\d[ABFJNST][0-9]{1,3}$",]

var list_kentens: [String] = ["21-snz-2", "31-snz-2"]

for kenteken in list_kentens {
  for reg in ekns {
      print(reg)
      print(kenteken)
      //matchcd
  }
}
