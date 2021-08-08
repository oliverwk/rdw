//
//  Coordinator.swift
//  rdw
//
//  Created by Maarten Wittop Koning on 03/08/2020.
//  Copyright © 2020 Olivier Wittop Koning. All rights reserved.
//

import SwiftUI
import MLKit
import MLKitTextRecognition
import MLKitVision
import Foundation

import os
func logError(_ msg: StaticString, _ params: Any...) {
    os_log(msg, log: OSLog.default, type: .error, params)
}


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?
    @Binding var StringInCoordinator: String
    @Binding var DataInCoordinator: String

    init(isShown: Binding<Bool>, image: Binding<Image?>, resultText: Binding<String>, data: Binding<String>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
        _StringInCoordinator = resultText
        _DataInCoordinator = data
    }
    func isMatches(_ regex: String, _ kenteken: String) -> Bool {
        do {
            let range = NSRange(location: 0, length: kenteken.utf16.count)
            let regex = try NSRegularExpression(pattern: regex)
            return regex.firstMatch(in: kenteken, options: [], range: range) != nil
        } catch {
            print("Something went wrong! Error: \(error)")
            logError("Something went wrong! Error: %{public}@", error)
        }
        return false
    }

    let regers: [String] = ["^[a-zA-Z]{2}[\\-]{0,1}[\\d]{2}[\\-]{0,1}[\\d]{2}$",
    "^[\\d]{2}[\\-]{0,1}[\\d]{2}[\\-]{0,1}[a-zA-Z]{2}$",
    "^[\\d]{2}[\\-]{0,1}[a-zA-Z]{2}[\\-]{0,1}[\\d]{2}$",
    "^[a-zA-Z]{2}[\\-]{0,1}[\\d]{2}[\\-]{0,1}[a-zA-Z]{2}$",
    "^[a-zA-Z]{2}[\\-]{0,1}[a-zA-Z]{2}[\\-]{0,1}[\\d]{2}$",
    "^[\\d]{2}[\\-]{0,1}[a-zA-Z]{2}[\\-]{0,1}[a-zA-Z]{2}$",
    "^[\\d]{2}[\\-]{0,1}[a-zA-Z]{3}[\\-]{0,1}[\\d]{1}$",
    "^[\\d]{1}[\\-]{0,1}[a-zA-Z]{3}[\\-]{0,1}[\\d]{2}$",
    "^[a-zA-Z]{2}[\\-]{0,1}[\\d]{3}[\\-]{0,1}[a-zA-Z]{1}$",
    "^[a-zA-Z]{1}[\\-]{0,1}[\\d]{3}[\\-]{0,1}[a-zA-Z]{2}$",
    "^[a-zA-Z]{3}[\\-]{0,1}[\\d]{2}[\\-]{0,1}[a-zA-Z]{1}$",
    "^[a-zA-Z]{1}[\\-]{0,1}[\\d]{2}[\\-]{0,1}[a-zA-Z]{3}$",
    "^[\\d]{1}[\\-]{0,1}[a-zA-Z]{2}[\\-]{0,1}[\\d]{3}$",
    "^[\\d]{3}[\\-]{0,1}[a-zA-Z]{2}[\\-]{0,1}[\\d]{1}$",
    "^C\\d[ABFJNST][0-9]{1,3}$"]

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = Image(uiImage: unwrapImage)


        // MARK: - Begin MLkit


        let visionImage = VisionImage(image: unwrapImage)
        visionImage.orientation = unwrapImage.imageOrientation
        let textRecognizer = TextRecognizer.textRecognizer()
        textRecognizer.process(visionImage) { result, error in
          guard error == nil, let result = result else {
            // Error handling
            print(error ?? "error while Recognising the text")
            self.StringInCoordinator = "Probeer het opnieuw."
            self.DataInCoordinator = "maak uw foto opnieuw."
            return
          }
            let resultText = result.text
            print(resultText)
            if resultText.contains("\n"){
                let words = resultText.split(separator: "\n")
                print(words[1])
                for HetKenteken in words {
                    for reg in self.regers {
                        if self.isMatches(reg, HetKenteken.contains("-") ? String(HetKenteken).replacingOccurrences(of: "-", with: "") : String(HetKenteken)) {
                             //found
                             print(String(HetKenteken) + " Is een kenteken")
                             self.httpPost(kenteken: String(HetKenteken))
                             self.StringInCoordinator = String(resultText)
                          } else {
                             logError("%{public}@  Is geen kenteken",  HetKenteken)
                             print(String(HetKenteken) + " Is geen kenteken")
                             //not found
                          }
                      }
                    }
            } else {
                for reg in self.regers {
                      if self.isMatches(reg, resultText.contains("-") ? String(resultText).replacingOccurrences(of: "-", with: "") : String(resultText)) {
                         //found
                         logError("%{public}@  Is een kenteken",  String(resultText))
                         print(String(resultText) + " Is een kenteken")
                         self.httpPost(kenteken: String(resultText))
                         self.StringInCoordinator = String(resultText)
                      } else {
                         logError("%{public}@  Is geen kenteken",  String(resultText))
                         print(String(resultText) + " Is geen kenteken")
                         //not found
                      }
                  }
            }
            //TODO: aan core data toevoegen
                
        }
        // MARK: - End MLkit
            self.isCoordinatorShown = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
    // MARK: - begin reqeusts rdw
    func httpPost(kenteken: String) {
        let url = URL(string: "https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312")!
        //response.statusCode
        var request = URLRequest(url: url)
        request.setValue("RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 14.2.0) Alamofire/4.7.3", forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let theHttpBody = "{\"KENTEKEN\" : \"\(kenteken.replacingOccurrences(of: "-", with: "").uppercased())\" }";
        print(theHttpBody)
        ///let theHttpBody = "{\"KENTEKEN\":\"21SNZ3\"}";
        request.httpBody = Data(theHttpBody.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode != 200 {
                    self.StringInCoordinator = "\(httpResponse.statusCode)"
                    self.DataInCoordinator = "Er ging iets mis met het HTTP/2 verzoek naar de rdw"
                    return
                }
            }
                if let d = data {
                    do {
                        let autor = try newJSONDecoder().decode(Deauto.self, from: d)
                        logError("Autor: %{public}@",  autor.openbVrtgInfo.vrtgStandGeg)
                        print("Autor: \(autor.openbVrtgInfo.vrtgStandGeg)")
                        self.StringInCoordinator = kenteken
                        self.DataInCoordinator = "Een \(autor.openbVrtgInfo.vrtgStandGeg.merkBeschr.lowercased().capitalized) \(autor.openbVrtgInfo.vrtgStandGeg.typeBeschrVtg.lowercased().capitalized) in het: \(autor.openbVrtgInfo.vrtgStandGeg.actKleur1)"
                    } catch {
                        logError("Error with json decode")
                        print("Error with json decode")
                    }
                } else {
                    logError("Error with making the HTTP reqeust to the rdw", error as Any)
                    print("Error with making the HTTP reqeust to the rdw", error as Any)
                }
        }
        task.resume()
    }
}
