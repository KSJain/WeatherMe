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
    private var currentLocation: CLLocationCoordinate2D?
    private var viewModel: CurrentWeatherViewModel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureLocationManager()
        getCurrentUserLocation()
    }
    
    private func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        setGradient()
    }
    
    private func setGradient() {
        let layer                       = CAGradientLayer()
        layer.frame                     = view.bounds
        layer.startPoint                = CGPoint(x: 0,y: 0)
        layer.endPoint                  = CGPoint(x: 1,y: 1)
        layer.colors                    = [UIColor.systemGray6.cgColor,
                                           UIColor.systemGray5.cgColor,
                                           UIColor.systemGray2.cgColor,
                                           UIColor.systemGray.cgColor]
        view.layer.addSublayer(layer)
    }
    
    private func updateUI(with viewModel: CurrentWeatherViewModel)  {
        print(viewModel)
        DispatchQueue.main.async {
            self.title = viewModel.timeZone
        }
    }
}

extension CurrentTempratureVC: UserLocationDelegate {
    
    private func configureLocationManager() {
        locationManager                 = LocationManager(set: self)
    }
    
    private func getCurrentUserLocation() {
        locationManager.determineMyCurrentLocation()
    }
    
    func didGetUsersCurrntLocastion(_ location: CLLocationCoordinate2D) {
        currentLocation                 = location
        getCurrentWeatherFor(location: location)
    }
    
}

extension CurrentTempratureVC {
    
    private func getCurrentWeatherFor(location: CLLocationCoordinate2D) {
        
        NetworkManager.shared.getCurrentWeatherForUsersLocation(coordinates: location) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.failure(let error):
                print("Error: \(error.rawValue)")
            case .success(let data):
                self.viewModel          = CurrentWeatherViewModel(currentWeather: data)
                self.updateUI(with: self.viewModel)
            }
        }
    }
}
