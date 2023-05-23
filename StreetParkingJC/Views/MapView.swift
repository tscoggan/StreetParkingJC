//
//  Maps.swift
//  StreetParkingJC
//
//  Created by Tom Scoggan on 5/13/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var currentState: CurrentState
    
    let locationManager = CLLocationManager()
    
    let mvDelegate = MapViewDelegate()
    
    let locMgrDelegate = LocationMgrDelegate()
    
    let defaultLocation = CLLocationCoordinate2D(latitude: 40.720690, longitude: -74.046660)
    
    func makeUIView(context: Context) -> MKMapView {
        locMgrDelegate.setMapView(self)
        locationManager.delegate = locMgrDelegate
        let mv =  MKMapView(frame: .zero)
        mv.showsUserLocation = true
        mv.delegate = mvDelegate
        updateMap(mv)

//        let p1 = MKMapPoint(CLLocationCoordinate2D(latitude: 40.71809322149233, longitude: -74.04620004425092))
//        let p2 = MKMapPoint(CLLocationCoordinate2D(latitude: 40.717506038838614, longitude: -74.04651640780612))
//        let overlay = MKPolyline(points: [p1,p2], count: 2)
//        mv.addOverlay(overlay)
        
        return mv
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        updateMap(view)
    }
    
    func setUserLocationAuth(_ isAuthorized: Bool) {
        currentState.userLocationIsAuthorized = isAuthorized
    }
    
    private func updateMap(_ view: MKMapView) {
        var coordinate: CLLocationCoordinate2D {
            switch currentState.userLocationIsAuthorized {
                case true:
                    let location = locationManager.location
                    return location?.coordinate ?? defaultLocation
                case false:
                    return defaultLocation
            }
        }
        
        print("Current location: \(coordinate)")
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
}

class MapViewDelegate: NSObject, MKMapViewDelegate {
    
    private let overlayColor = UIColor.yellow
    private let overlayTransparency = 0.5
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        switch overlay {
            case let overlay as MKCircle:
                let renderer = MKCircleRenderer(circle: overlay)
                renderer.fillColor = overlayColor
                renderer.alpha = overlayTransparency
                return renderer
            
            case let overlay as MKPolyline:
                let renderer = MKPolylineRenderer(polyline: overlay)
                renderer.fillColor = overlayColor
                renderer.strokeColor = overlayColor
                renderer.lineWidth = 5
                renderer.alpha = overlayTransparency
                return renderer
            
            default:
                return MKOverlayRenderer(overlay: overlay)
        }
            
    }
    
}

class LocationMgrDelegate: NSObject, CLLocationManagerDelegate {
    
    @EnvironmentObject var currentState: CurrentState
    
    var mapView: MapView?
    
    func setMapView(_ mv: MapView) {
        self.mapView = mv
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if CLLocationManager.locationServicesEnabled() {
            switch mapView!.locationManager.authorizationStatus {
              case .authorizedWhenInUse:
                mapView!.setUserLocationAuth(true)
              case .denied: // Show alert telling users how to turn on permissions
                print("authorizationStatus: denied")
                mapView!.setUserLocationAuth(false)
                break
              case .notDetermined:
                mapView!.locationManager.requestWhenInUseAuthorization()
                break
              case .restricted: // Show an alert letting them know what’s up
                print("authorizationStatus: restricted")
                mapView!.setUserLocationAuth(false)
                break
              case .authorizedAlways:
                mapView!.setUserLocationAuth(true)
                break
              @unknown default:
                fatalError("Unknown CLLocationManager.authorizationStatus")
            }
        } else {
            mapView!.setUserLocationAuth(false)
            print("Location services disabled")
        }
    }
    
}
