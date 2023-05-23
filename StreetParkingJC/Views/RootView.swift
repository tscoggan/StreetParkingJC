//
//  MainView.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/10/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var currentState: CurrentState
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Colors.appBackground.ignoresSafeArea()
                
                switch currentState.currentView {
                    case .TitleScreenView: TitleScreenView()
                    case .ParkingMapView: ParkingMapView()
                    case .SettingsView: SettingsView()
                }
                
            }
            .foregroundColor(Colors.appForeground)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        currentState.changeView(to: ViewType.ParkingMapView)
                    }) {
                        VStack {
                            Image(systemName: "map")
                            Text("Street Map")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.ParkingMapView)
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.SettingsView)
                    }) {
                        VStack {
                            Image(systemName: "airplane")
                            Text("Settings")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.SettingsView)
                    
                }
            }
        }//.preferredColorScheme(.dark)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CurrentState())
    }
}