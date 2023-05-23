//
//  TitleScreenView.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

struct TitleScreenView: View {
    var body: some View {
        VStack {
            Text("Title Screen")
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        .padding()
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
