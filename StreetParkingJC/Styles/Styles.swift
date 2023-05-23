//
//  Styles.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/23/23.
//

import SwiftUI

struct Styles {
    static let buttonRadius: CGFloat = 15
}

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Colors.buttonBackground.opacity(0.5) : Colors.buttonBackground)
            .foregroundColor(Colors.buttonForeground)
            .clipShape(RoundedRectangle(cornerRadius: Styles.buttonRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: Styles.buttonRadius)
                    .stroke(Colors.buttonBorder, lineWidth: 3)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

extension View {
    func addSelectedBadge(_ isSelected: Bool) -> some View {
        ZStack(alignment: .topTrailing) {
            self

            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .offset(x: 3, y: -3)
            }
        }
    }
}

struct Styles_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}
