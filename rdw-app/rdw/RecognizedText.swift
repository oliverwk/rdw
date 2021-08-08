//
//  RecognizedText.swift
//  rdw
//
//  Created by Maarten Wittop Koning on 03/08/2020.
//  Copyright © 2020 Olivier Wittop Koning. All rights reserved.
//


import Combine
import SwiftUI

final class RecognizedText: ObservableObject, Identifiable {
    
    let willChange = PassthroughSubject<RecognizedText, Never>()
    
    var value: String = "Scan document to see its contents" {
        willSet {
            willChange.send(self)
        }
    }
    
}
