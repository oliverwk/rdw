//
//  ResultView.swift
//  rdw
//
//  Created by Maarten Wittop Koning on 03/08/2020.
//  Copyright © 2020 Olivier Wittop Koning. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    var restext: String
    var body: some View {
        Text(restext)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(restext: "21-SNZ-3")
    }
}
