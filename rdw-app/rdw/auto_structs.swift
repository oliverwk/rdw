// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let deauto = try? newJSONDecoder().decode(Deauto.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.deautoTask(with: url) { deauto, response, error in
//     if let deauto = deauto {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Deauto
struct Deauto: Codable {
    let version, encoding: String
    let openbVrtgInfo: OpenbVrtgInfo

    enum CodingKeys: String, CodingKey {
        case version, encoding
        case openbVrtgInfo = "OPENB-VRTG-INFO"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.openbVrtgInfoTask(with: url) { openbVrtgInfo, response, error in
//     if let openbVrtgInfo = openbVrtgInfo {
//       ...
//     }
//   }
//   task.resume()

// MARK: - OpenbVrtgInfo
struct OpenbVrtgInfo: Codable {
    let xmlnsXSD, xmlnsXsi: String
    let algGeg: AlgGeg
    let kentGeg: KentGeg
    let vrtgStandGeg: VrtgStandGeg
    let carrosUitvTab: CarrosUitvTab
    let bpmGeg: BPMGeg
    let vrtgTerugrGeg: VrtgTerugrGeg
    let byzVrtgTab: JSONNull?
    let brVrtgTab: BrVrtgTab
    let asVrtgTab: AsVrtgTab
    let subCatEuTab: JSONNull?
    let telStandGeg: TelStandGeg
    let terugrActTab: TerugrActTab

    enum CodingKeys: String, CodingKey {
        case xmlnsXSD = "@xmlns$xsd"
        case xmlnsXsi = "@xmlns$xsi"
        case algGeg = "ALG-GEG"
        case kentGeg = "KENT-GEG"
        case vrtgStandGeg = "VRTG-STAND-GEG"
        case carrosUitvTab = "CARROS-UITV-TAB"
        case bpmGeg = "BPM-GEG"
        case vrtgTerugrGeg = "VRTG-TERUGR-GEG"
        case byzVrtgTab = "BYZ-VRTG-TAB"
        case brVrtgTab = "BR-VRTG-TAB"
        case asVrtgTab = "AS-VRTG-TAB"
        case subCatEuTab = "SUB-CAT-EU-TAB"
        case telStandGeg = "TEL-STAND-GEG"
        case terugrActTab = "TERUGR-ACT-TAB"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.algGegTask(with: url) { algGeg, response, error in
//     if let algGeg = algGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AlgGeg
struct AlgGeg: Codable {
    let gebrIdent, procIdent, procFunc, optStatTekst: String
    let infoGebr: String

    enum CodingKeys: String, CodingKey {
        case gebrIdent = "GEBR-IDENT"
        case procIdent = "PROC-IDENT"
        case procFunc = "PROC-FUNC"
        case optStatTekst = "OPT-STAT-TEKST"
        case infoGebr = "INFO-GEBR"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.asVrtgTabTask(with: url) { asVrtgTab, response, error in
//     if let asVrtgTab = asVrtgTab {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AsVrtgTab
struct AsVrtgTab: Codable {
    let asVrtgGeg: [AsVrtgGeg]

    enum CodingKeys: String, CodingKey {
        case asVrtgGeg = "AS-VRTG-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.asVrtgGegTask(with: url) { asVrtgGeg, response, error in
//     if let asVrtgGeg = asVrtgGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AsVrtgGeg
struct AsVrtgGeg: Codable {
    let asNrVrtg, maxLastAs: String
    let plaatsAsCode: JSONNull?
    let spoorBreedte, maxLastAsT: String

    enum CodingKeys: String, CodingKey {
        case asNrVrtg = "AS-NR-VRTG"
        case maxLastAs = "MAX-LAST-AS"
        case plaatsAsCode = "PLAATS-AS-CODE"
        case spoorBreedte = "SPOOR-BREEDTE"
        case maxLastAsT = "MAX-LAST-AS-T"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.bPMGegTask(with: url) { bPMGeg, response, error in
//     if let bPMGeg = bPMGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - BPMGeg
struct BPMGeg: Codable {
    let bpmBedrag: String

    enum CodingKeys: String, CodingKey {
        case bpmBedrag = "BPM-BEDRAG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.brVrtgTabTask(with: url) { brVrtgTab, response, error in
//     if let brVrtgTab = brVrtgTab {
//       ...
//     }
//   }
//   task.resume()

// MARK: - BrVrtgTab
struct BrVrtgTab: Codable {
    let brVrtgGeg: BrVrtgGeg

    enum CodingKeys: String, CodingKey {
        case brVrtgGeg = "BR-VRTG-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.brVrtgGegTask(with: url) { brVrtgGeg, response, error in
//     if let brVrtgGeg = brVrtgGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - BrVrtgGeg
struct BrVrtgGeg: Codable {
    let brandstCVrb, brandstof, netMaxVerm, geluidNiv: String
    let toerenGelNiv, emissieCode, emisCo2COMBr, verbrStadBr: String
    let verbrBuitenBr, verbrCombBr, emisFaseMv, emisAandIEu: String
    let vrtgBrT1WGeg, vrtgBrVbwGeg: JSONNull?

    enum CodingKeys: String, CodingKey {
        case brandstCVrb = "BRANDST-C-VRB"
        case brandstof = "BRANDSTOF"
        case netMaxVerm = "NET-MAX-VERM"
        case geluidNiv = "GELUID-NIV"
        case toerenGelNiv = "TOEREN-GEL-NIV"
        case emissieCode = "EMISSIE-CODE"
        case emisCo2COMBr = "EMIS-CO2-COM-BR"
        case verbrStadBr = "VERBR-STAD-BR"
        case verbrBuitenBr = "VERBR-BUITEN-BR"
        case verbrCombBr = "VERBR-COMB-BR"
        case emisFaseMv = "EMIS-FASE-MV"
        case emisAandIEu = "EMIS-AAND-I-EU"
        case vrtgBrT1WGeg = "VRTG-BR-T1W-GEG"
        case vrtgBrVbwGeg = "VRTG-BR-VBW-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.carrosUitvTabTask(with: url) { carrosUitvTab, response, error in
//     if let carrosUitvTab = carrosUitvTab {
//       ...
//     }
//   }
//   task.resume()

// MARK: - CarrosUitvTab
struct CarrosUitvTab: Codable {
    let carrosUitvGeg: CarrosUitvGeg

    enum CodingKeys: String, CodingKey {
        case carrosUitvGeg = "CARROS-UITV-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.carrosUitvGegTask(with: url) { carrosUitvGeg, response, error in
//     if let carrosUitvGeg = carrosUitvGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - CarrosUitvGeg
struct CarrosUitvGeg: Codable {
    let carrosVnr, typeCarrosEu, typeCarrosOms: String

    enum CodingKeys: String, CodingKey {
        case carrosVnr = "CARROS-VNR"
        case typeCarrosEu = "TYPE-CARROS-EU"
        case typeCarrosOms = "TYPE-CARROS-OMS"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.kentGegTask(with: url) { kentGeg, response, error in
//     if let kentGeg = kentGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - KentGeg
struct KentGeg: Codable {
    let kenteken: String

    enum CodingKeys: String, CodingKey {
        case kenteken = "KENTEKEN"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.telStandGegTask(with: url) { telStandGeg, response, error in
//     if let telStandGeg = telStandGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - TelStandGeg
struct TelStandGeg: Codable {
    let regJaarTelSt, trendinfKlOms, toelTrendinfo: String

    enum CodingKeys: String, CodingKey {
        case regJaarTelSt = "REG-JAAR-TEL-ST"
        case trendinfKlOms = "TRENDINF-KL-OMS"
        case toelTrendinfo = "TOEL-TRENDINFO"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.terugrActTabTask(with: url) { terugrActTab, response, error in
//     if let terugrActTab = terugrActTab {
//       ...
//     }
//   }
//   task.resume()

// MARK: - TerugrActTab
struct TerugrActTab: Codable {
    let terugrActGeg: TerugrActGeg

    enum CodingKeys: String, CodingKey {
        case terugrActGeg = "TERUGR-ACT-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.terugrActGegTask(with: url) { terugrActGeg, response, error in
//     if let terugrActGeg = terugrActGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - TerugrActGeg
struct TerugrActGeg: Codable {
    let statVTerOms, bDATTerugRdw: String
    let terugrRisTab: TerugrRisTab

    enum CodingKeys: String, CodingKey {
        case statVTerOms = "STAT-V-TER-OMS"
        case bDATTerugRdw = "B-DAT-TERUG-RDW"
        case terugrRisTab = "TERUGR-RIS-TAB"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.terugrRisTabTask(with: url) { terugrRisTab, response, error in
//     if let terugrRisTab = terugrRisTab {
//       ...
//     }
//   }
//   task.resume()

// MARK: - TerugrRisTab
struct TerugrRisTab: Codable {
    let terugrRisGeg: TerugrRisGeg

    enum CodingKeys: String, CodingKey {
        case terugrRisGeg = "TERUGR-RIS-GEG"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.terugrRisGegTask(with: url) { terugrRisGeg, response, error in
//     if let terugrRisGeg = terugrRisGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - VrtgStandGeg
struct VrtgStandGeg: Codable {
    let soortAandOms, inrichtOms, merkBeschr, typeBeschrVtg: String
    let actKleur1, aantCyl, cylInhoud, aantZitpl: String
    let aantStaanpl: JSONNull?
    let massaLeegVrtg: String
    let laadvermogen: JSONNull?
    let maxMassaVrtg, massaBedrKl, maxMasOng, maxMasGer: String
    let maxMasOplGer, maxMasAutGer, maxMasMidGer: JSONNull?
    let maxMasSamenst: String
    let maxConstrSn: JSONNull?
    let eersteInsDAT, eersteToelDAT, regDATAanspr, regTydAanspr: String
    let vervDATKeur, verzekerdInd, statWokInd, statGestInd: String
    let verbrCatUitv: JSONNull?
    let catalogusPrys, typeFabr, typeGoedkNr, eegVarCode: String
    let eegUitvCode, eegVrtgCatKB, plVrtgIDNrV, aantEigenVrtg: String
    let aantOpnamBedr, maxMasVrtgT, statExpInd: String
    let aantDeuren, hKopAzVrtg: JSONNull?
    let wielbasis: String
    let vervDATTach, lengte, breedte: JSONNull?
    let aantAssen, aantWielen: String
    let afwMaxSnelh, masBedrKlMin, masBedrKlMax, maxMasTMax: JSONNull?
    let maxMasTMin, subCatNl: JSONNull?
    let subCatNlOms: JSONNull?

    enum CodingKeys: String, CodingKey {
        case soortAandOms = "SOORT-AAND-OMS"
        case inrichtOms = "INRICHT-OMS"
        case merkBeschr = "MERK-BESCHR"
        case typeBeschrVtg = "TYPE-BESCHR-VTG"
        case actKleur1 = "ACT-KLEUR-1"
        case aantCyl = "AANT-CYL"
        case cylInhoud = "CYL-INHOUD"
        case aantZitpl = "AANT-ZITPL"
        case aantStaanpl = "AANT-STAANPL"
        case massaLeegVrtg = "MASSA-LEEG-VRTG"
        case laadvermogen = "LAADVERMOGEN"
        case maxMassaVrtg = "MAX-MASSA-VRTG"
        case massaBedrKl = "MASSA-BEDR-KL"
        case maxMasOng = "MAX-MAS-ONG"
        case maxMasGer = "MAX-MAS-GER"
        case maxMasOplGer = "MAX-MAS-OPL-GER"
        case maxMasAutGer = "MAX-MAS-AUT-GER"
        case maxMasMidGer = "MAX-MAS-MID-GER"
        case maxMasSamenst = "MAX-MAS-SAMENST"
        case maxConstrSn = "MAX-CONSTR-SN"
        case eersteInsDAT = "EERSTE-INS-DAT"
        case eersteToelDAT = "EERSTE-TOEL-DAT"
        case regDATAanspr = "REG-DAT-AANSPR"
        case regTydAanspr = "REG-TYD-AANSPR"
        case vervDATKeur = "VERV-DAT-KEUR"
        case verzekerdInd = "VERZEKERD-IND"
        case statWokInd = "STAT-WOK-IND"
        case statGestInd = "STAT-GEST-IND"
        case verbrCatUitv = "VERBR-CAT-UITV"
        case catalogusPrys = "CATALOGUS-PRYS"
        case typeFabr = "TYPE-FABR"
        case typeGoedkNr = "TYPE-GOEDK-NR"
        case eegVarCode = "EEG-VAR-CODE"
        case eegUitvCode = "EEG-UITV-CODE"
        case eegVrtgCatKB = "EEG-VRTG-CAT-KB"
        case plVrtgIDNrV = "PL-VRTG-ID-NR-V"
        case aantEigenVrtg = "AANT-EIGEN-VRTG"
        case aantOpnamBedr = "AANT-OPNAM-BEDR"
        case maxMasVrtgT = "MAX-MAS-VRTG-T"
        case statExpInd = "STAT-EXP-IND"
        case aantDeuren = "AANT-DEUREN"
        case hKopAzVrtg = "H-KOP-AZ-VRTG"
        case wielbasis = "WIELBASIS"
        case vervDATTach = "VERV-DAT-TACH"
        case lengte = "LENGTE"
        case breedte = "BREEDTE"
        case aantAssen = "AANT-ASSEN"
        case aantWielen = "AANT-WIELEN"
        case afwMaxSnelh = "AFW-MAX-SNELH"
        case masBedrKlMin = "MAS-BEDR-KL-MIN"
        case masBedrKlMax = "MAS-BEDR-KL-MAX"
        case maxMasTMax = "MAX-MAS-T-MAX"
        case maxMasTMin = "MAX-MAS-T-MIN"
        case subCatNl = "SUB-CAT-NL"
        case subCatNlOms = "SUB-CAT-NL-OMS"
    }
}

// MARK: - TerugrRisGeg
struct TerugrRisGeg: Codable {
    let terugrRisOms: String

    enum CodingKeys: String, CodingKey {
        case terugrRisOms = "TERUGR-RIS-OMS"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.vrtgTerugrGegTask(with: url) { vrtgTerugrGeg, response, error in
//     if let vrtgTerugrGeg = vrtgTerugrGeg {
//       ...
//     }
//   }
//   task.resume()

// MARK: - VrtgTerugrGeg
struct VrtgTerugrGeg: Codable {
    let terugrStatOms: String

    enum CodingKeys: String, CodingKey {
        case terugrStatOms = "TERUGR-STAT-OMS"
    }
}
struct vrtgStandGeg: Codable {
    let SOORTAANDOMS: String
    let INRICHTOMS: String
    let MERKBESCHR: String
    let TYPEBESCHRVTG: String

    enum CodingKeys: String, CodingKey {
        case SOORTAANDOMS = "SOORT-AAND-OMS"
        case INRICHTOMS = "INRICHT-OMS"
        case MERKBESCHR = "MERK-BESCHR"
        case TYPEBESCHRVTG = "TYPE-BESCHR-VTG"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func deautoTask(with url: URL, completionHandler: @escaping (Deauto?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
