//
//  LocationManager.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/30/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import CoreLocation
import Foundation

protocol UserLocationDelegate {
    func didGetUsersCurrntLocastion(_ location: CLLocationCoordinate2D)
}

class LocationManager: NSObject {
    
    private var locationManager:CLLocationManager!
    private var userLocation:CLLocation!
    
    var delegate: UserLocationDelegate!
    
    init(set delegate: UserLocationDelegate) {
        super.init()
        self.delegate = delegate
        configureLocationManager()
    }
    
    private func configureLocationManager() {

        locationManager                     = CLLocationManager()
        locationManager.delegate            = self
        locationManager.desiredAccuracy     = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func determineMyCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        manager.stopUpdatingLocation()
        userLocation = locations[0] as CLLocation
        delegate.didGetUsersCurrntLocastion(userLocation.coordinate)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
