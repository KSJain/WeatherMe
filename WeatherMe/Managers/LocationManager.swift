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
    func locationManagerDoesNotHavePermissions()
}

class LocationManager: NSObject {
    
    private var locationManager: CLLocationManager?
    private var userLocation: CLLocation?
    
    var delegate: UserLocationDelegate?
    
    init(set delegate: UserLocationDelegate) {
        super.init()
        self.delegate = delegate
        configureLocationManager()
    }
    
    private func configureLocationManager() {
        locationManager                     = CLLocationManager()
        
        guard let locationManager = locationManager else { return }
        locationManager.delegate            = self
        locationManager.desiredAccuracy     = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func determineMyCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            guard let locationManager = locationManager else { return }
            locationManager.startUpdatingLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        manager.stopUpdatingLocation()
        userLocation = locations[0] as CLLocation
        
        guard let userLocation = userLocation else { return }
        guard let delegate = delegate else { return }

        delegate.didGetUsersCurrntLocastion(userLocation.coordinate)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let delegate = delegate else { return }
        delegate.locationManagerDoesNotHavePermissions()
    }
}
