//
//  ParkingMapView.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/23/23.
//

import SwiftUI

struct ParkingMapView: View {
    @EnvironmentObject var currentState: CurrentState
    
    var body: some View {
        VStack {
            Text("Jersey City Parking Map")
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                TextField("Search for location", text: $currentState.mapSearchText)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(Color.white)
                Image(systemName: "magnifyingglass")
            }
            MapView()
        }
        .padding()
    }
}

struct ParkingMapView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingMapView().environmentObject(CurrentState())
    }
}
