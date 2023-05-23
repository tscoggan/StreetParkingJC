//
//  Colors.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/23/23.
//

import SwiftUI

struct Colors {
    static let appBackground: Color = Color(red: 0.9, green: 0.9, blue: 0.9)
    static let appForeground: Color = .black.opacity(0.7)
    static let buttonBackground: Color = buttonBorder.opacity(0.8)
    static let buttonBorder: Color = Color.blue.opacity(0.9)
    static let buttonForeground: Color = .white
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
