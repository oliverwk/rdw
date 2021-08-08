//
//  ContentView.swift
//  TextRecognizerSwiftUI
//
//  Created by Maarten Wittop Koning on 03/08/2020.
//  Copyright © 2020 Olivier Wittop Koning. All rights reserved.
//
/*

import Combine
import SwiftUI
import Foundation

struct CaptureImageView {
  
  /// MARK: - Properties
  @Binding var isShown: Bool
  @Binding var image: Image?
  @Binding var result: String
  @Binding var data: String
  @Binding var iscamera: Bool
    
  func ins(iscamera: Bool){
        if(iscamera){
            print(iscamera)
            var sourceType: UIImagePickerController.SourceType = .camera
        }
        else{
            var sourceType: UIImagePickerController.SourceType = .photoLibrary
        }
    }
    
  
    

    var sourceType: UIImagePickerController.SourceType = .photoLibrary
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image, resultText: $result, data: $data)
  }
}

extension CaptureImageView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    self.ins(iscamera: iscamera)
    //picker.sourceType = .camera
    print(sourceType)
    /// Default is images gallery. Un-comment the next line of code if you would like to test camera
    picker.sourceType = sourceType
    return picker
  }

  
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageView>) {
    
  }
}

struct ContentViews: View {
  // let iscamera = false
  var sourceType: UIImagePickerController.SourceType = .photoLibrary
  @State var image: Image? = nil
  @State var showCaptureImageView: Bool = false
  @State var result: String = ""
  @State var data: String = "Niets, Klopt."
  @State var iscamera: Bool = false
    
  var body: some View {
    ZStack {
      VStack {
        HStack {
        Button(action: {
          self.showCaptureImageView.toggle()
          var iscamera = true
        }) {
         Image(systemName: "camera").padding(20)
         .font(.largeTitle)
        }
        Button(action: {
          self.showCaptureImageView.toggle()
             var iscamera = false
        }) {
         Image(systemName: "photo.on.rectangle")
        }.padding(20)
        .font(.largeTitle)
        }
        image?.resizable()
          .aspectRatio(contentMode: .fit)
          .padding(15)
          .cornerRadius(20)
        Text(result)
        .padding(10)
        Text(data)
        .padding(10)
      }
      if (showCaptureImageView) {
        CaptureImageView(isShown: $showCaptureImageView, image: $image, result: $result, data: $data, iscamera: $iscamera)
      }
    }
  }
}
*/
