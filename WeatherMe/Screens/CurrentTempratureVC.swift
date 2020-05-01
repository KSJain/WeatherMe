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
        didSet {
            getCurrentWeatherFor(location: currentLocation!)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor        = .systemBlue
        
        configureLocationManager()
        getCurrentUserLocation()
    }
    
    private func getCurrentWeatherFor(location: CLLocationCoordinate2D) {
        
        NetworkManager.shared.getCurrentWeatherForUsersLocation(coordinates: location) { result in
            switch result {
            case.failure(let error):
                print("Error: \(error.rawValue)")
            case .success(let data):
                let kelvinTemp = data.current.temp
                let ferenhightTemp = (kelvinTemp - 273.15) * 9/5 + 32
                let tempString = String(format: "%.1f", ferenhightTemp)
                
                let timeZone = data.timezone.split(separator: "/")
                if timeZone.count == 2 {
                    print("Current \(timeZone[1]) Weather: \(tempString) degree F")
                }
            }
        }
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
