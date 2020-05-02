//
//  ForecastWeatherVC.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastWeatherVC: UIViewController  {
    
    private var locationManager: LocationManager!
    private var currentLocation: CLLocationCoordinate2D?
    private var viewModel: ForecastWeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureLocationManager()
        getCurrentUserLocation()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemRed
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    private func updateUI(with viewModel: ForecastWeatherViewModel)  {
        print(viewModel)
        DispatchQueue.main.async {
            self.title = "5 Days in \(viewModel.city)"
        }
    }
}


extension ForecastWeatherVC: UserLocationDelegate {
    
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


extension ForecastWeatherVC {
    
    private func getCurrentWeatherFor(location: CLLocationCoordinate2D) {
        
        NetworkManager.shared.getForecastWeatherForUsersLocation(coordinates: location) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.failure(let error):
                print("Error: \(error.rawValue)")
            case .success(let data):
                self.viewModel = ForecastWeatherViewModel(with: data)
                self.updateUI(with: self.viewModel)
            }
        }
    }
}
