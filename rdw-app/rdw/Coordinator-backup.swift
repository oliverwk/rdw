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
            print(error ?? "error")
            self.StringInCoordinator = "Probeer het opnieuw."
            self.DataInCoordinator = "maak uw foto opnieuw."
            return
          }
            let resultText = result.text
            print(resultText)
            if resultText.contains("\n"){
                let words = resultText.split(separator: "\n")
                print(words[1])
                for word in words{
                    print(word.count)
                    if word.contains("-"){
                        if word.count == 7 {
                            let fin_url = String(word)
                            self.StringInCoordinator = fin_url
                            let ssl = "https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312"
                            self.httpPost(ssl: ssl, kenteken: fin_url)
                        }
                        else{
                            self.StringInCoordinator = "Probeer het opnieuw."
                            self.DataInCoordinator = "maak uw foto opnieuw."
                        }
                    }
                }
            }
            else {
                if resultText.contains("-"){
                    if resultText.count == 7 {
                        let fin_url = String(resultText)
                        self.StringInCoordinator = fin_url
                        let ssl = "https://api.rdw.nl/ovi/version=v1?subscription-key=cb3b64e6d34b4e02ac4a6aa0b02b4312"
                        self.httpPost(ssl: ssl, kenteken: fin_url)
                    }
               }
                else{
                    self.StringInCoordinator = "Probeer het opnieuw."
                    self.DataInCoordinator = "maak uw foto opnieuw."
                }
            }
            /*
            if let index = resultText.range(of: "\n")?.lowerBound {
                let substring = resultText[..<index]                 // "ora"
                // or  let substring = word.prefix(upTo: index) // "ora"
                // (see picture below) Using the prefix(upTo:) method is equivalent to using a partial half-open range as the collection’s subscript.
                // The subscript notation is preferred over prefix(upTo:).
                //orange
               let fin_url = String(substring)
                self.StringInCoordinator = fin_url
                let ssl = "https://rdw-api.wttp.workers.dev/?kenteken=\(fin_url)"
                self.httpPost(ssl: ssl)
            }
            else {
                print("zit geen kenteken in")
            }*/
            //TODO: aan database of core data ?

          // Recognized text
        }
        // MARK: - End MLkit
       isCoordinatorShown = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
    // MARK: - begin reqeusts rdw
    func httpPost(ssl: String, kenteken: String) {
        let url = URL(string: ssl)!
        //response.statusCode
        var request = URLRequest(url: url)
        request.setValue("RDWVoertuig/2.5.0 (nl.rdw.Voertuig; build:5; iOS 14.2.0) Alamofire/4.7.3", forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let theHttpBody = "{\"KENTEKEN\" : \""+kenteken.replacingOccurrences(of: "-", with: "").uppercased()+"\" }";
        print(theHttpBody)
        ///let theHttpBody = "{\"KENTEKEN\":\"21SNZ3\"}";
        request.httpBody = Data(theHttpBody.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let d = data, let dataString = String(data: d, encoding: .utf8) {
                    ///print("data: \(dataString)")
                    let autor = try? newJSONDecoder().decode(Deauto.self, from: d)
                    print("autor: \(autor!.openbVrtgInfo.vrtgStandGeg)")
                    self.DataInCoordinator = autor!.openbVrtgInfo.vrtgStandGeg.merkBeschr.lowercased().capitalized + " " + autor!.openbVrtgInfo.vrtgStandGeg.typeBeschrVtg.lowercased().capitalized + " In het: " + autor!.openbVrtgInfo.vrtgStandGeg.actKleur1// +"\n" + autor!.openbVrtgInfo.vrtgStandGeg.aantCyl
                    self.StringInCoordinator = kenteken
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error with json decode",error)
            }
            
        }
        task.resume()
    }
}


/*
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           if let error = error {
               print("error: \(error)")
           } else {
               if let response = response as? HTTPURLResponse {
                   print("statusCode: \(response.statusCode)")
               }
               if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  print("data: \(dataString)")
                  if let json = try JSONSerialization.jsonObject(with: dataString, options: .mutableContainers) as? [String: Any] {
                       print(json)
                       // handle json...
                   }
                   self.get_models(dataString: dataString)
                   //TODO: add json

               }

           }
       }
*/
