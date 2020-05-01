//
//  CurrentTempratureVC.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/30/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentTempratureVC: UIViewController {
    
    private var locationManager: LocationManager!
    private var currentLocation: CLLocationCoordinate2D? = nil {
        didSet { getCurrentWeatherForLocation() }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor        = .systemBlue
        
        configureLocationManager()
        getCurrentUserLocation()
    }
    
    private func getCurrentWeatherForLocation() {
        guard let location = currentLocation else { return }
        
        print("location.longitude   \(location.longitude)")
        print("location.latitude    \(location.latitude)")
    }
}

extension CurrentTempratureVC: UserLocationDelegate {
    
    private func configureLocationManager() {
        locationManager = LocationManager(set: self)
    }
    
    private func getCurrentUserLocation() {
        locationManager.determineMyCurrentLocation()
    }
    
    func didGetUsersCurrntLocastion(_ location: CLLocationCoordinate2D) {
        currentLocation = location
    }
}
