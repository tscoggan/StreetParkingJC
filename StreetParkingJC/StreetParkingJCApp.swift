//
//  StreetParkingJCApp.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/23/23.
//

import SwiftUI

@main
struct StreetParkingJCApp: App {
    
    @StateObject var currentState: CurrentState = CurrentState()
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(currentState)
        }
    }
    
}
