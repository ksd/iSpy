//
//  LocationController.swift
//  iSpy
//
//  Created by ksd on 13/10/2022.
//

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 56.119090,
            longitude: 10.14737),
        latitudinalMeters: 50,
        longitudinalMeters: 50)
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.first?.coordinate{
            region.center = coordinate
        }
    }
    
    private func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            manager.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("Not Determined")
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Always and WhenInUse")
            manager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
}
