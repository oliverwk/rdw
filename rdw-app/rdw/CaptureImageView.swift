//
//  CaptureImageView.swift
//  
//
//  Created by Maarten Wittop Koning on 03/08/2020.
//
import UIKit
import Foundation
import Combine

struct CaptureImageView {
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}
