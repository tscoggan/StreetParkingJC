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
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.ParkingMapView)
                    }) {
                        VStack {
                            Image(systemName: "map.fill")
                            Text("Street Map")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.ParkingMapView)
                    
                    Spacer()
                    
                    Button(action: {
                        currentState.changeView(to: ViewType.SettingsView)
                    }) {
                        VStack {
                            Image(systemName: "gearshape.fill")
                            Text("Settings")
                        }
                    }.buttonStyle(MainButtonStyle())
                    .addSelectedBadge(currentState.currentView == ViewType.SettingsView)
                    
                    Spacer()
                    
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
