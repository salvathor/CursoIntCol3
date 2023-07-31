//
//  LocationManager.swift
//  CLSwiftUI
//
//  Created by Salvador Lopez on 31/07/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    private let locationManger = CLLocationManager()
    @Published var currentLocation: CLLocation?
    
    override init(){
        super.init()
        locationManger.delegate = self
    }
    
    func requestLocation(){
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{
            return
        }
        currentLocation = location
        print("Course: \(currentLocation?.course)")
        print("Speed: \(currentLocation?.speed)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: \(error)")
    }
    
}
