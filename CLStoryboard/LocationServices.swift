//
//  LocationServices.swift
//  CLStoryboard
//
//  Created by Salvador Lopez on 31/07/23.
//

import Foundation
import CoreLocation

protocol LocationServicesDelegate: class {
    func authorizationRestricted()
    func authorizationUnknow()
    func promptAuthorizationAction()
    func didAuthorized()
}

class LocationServices: NSObject {
    
    var delegate: LocationServicesDelegate?
    var locationManager: CLLocationManager!
    
    var enable: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    init(locationManager: CLLocationManager = CLLocationManager()){
        super.init()
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }
    
    func requestAuthorization(){
        locationManager.requestAlwaysAuthorization()
    }
    
    func start(){
        locationManager.startUpdatingLocation()
    }
    
    func stop(){
        locationManager.stopUpdatingLocation()
    }
    
}

extension LocationServices: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
        case .denied:
            print("denied")
            delegate?.promptAuthorizationAction()
        case .restricted:
            print("restricted")
            delegate?.authorizationRestricted()
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            delegate?.didAuthorized()
        case .authorizedAlways:
            print("authorizedAlways")
            delegate?.didAuthorized()
        default:
            print("status unknow")
            delegate?.authorizationUnknow()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\t New Locations -->")
        dump(locations)
    }
    
}
