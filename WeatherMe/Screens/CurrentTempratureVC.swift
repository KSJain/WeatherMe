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
    
    private var currentDateLabel: WMTitleLabel!
    private var cityNameLabel: WMSecondaryTitleLabel!
    private var currentWeatherContainerView: WMWeatherContainerView!
    private var weatherDetailsLabel: WMTitleLabel!
    private var sunriseLabelView: WMSecondaryTitleLabel!
    private var sunsetLabelView: WMSecondaryTitleLabel!
    private var forecastButton: WMButton!

        
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
        
        configureButton()
        configureDateLabel()
        configureCityLabel()
        configureWeatherContainer()
        configureCurrentWeatherDiscriptor()
        sunUpDodnLabelsConfig()
    }
}


extension CurrentTempratureVC {
    
    private func updateUI(with viewModel: CurrentWeatherViewModel)  {
        DispatchQueue.main.async {
            self.title                      = viewModel.title
            self.currentDateLabel.text      = viewModel.date
            self.cityNameLabel.text         = viewModel.timeZone
            self.weatherDetailsLabel.text   = viewModel.currentWeatherDiscription
            self.sunriseLabelView.text      = viewModel.sunrise
            self.sunsetLabelView.text       = viewModel.sunset
            
            self.currentWeatherContainerView.setViewFor(viewModel: viewModel)
        }
    }
    
    private func sunUpDodnLabelsConfig() {
        let fontSize: CGFloat               = 25
        sunriseLabelView                    = WMSecondaryTitleLabel(textAlignment: .center, fontSize: fontSize)
        sunsetLabelView                     = WMSecondaryTitleLabel(textAlignment: .center, fontSize: fontSize)

        view.addSubview(sunriseLabelView)
        view.addSubview(sunsetLabelView)
        
        let padding: CGFloat                = 5
        
        NSLayoutConstraint.activate([
            sunriseLabelView.topAnchor.constraint(equalTo: weatherDetailsLabel.bottomAnchor, constant: padding + 5),
            sunriseLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunriseLabelView.heightAnchor.constraint(equalToConstant: fontSize * 1.2),
            sunriseLabelView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 10),
            
            sunsetLabelView.topAnchor.constraint(equalTo: sunriseLabelView.bottomAnchor, constant: padding),
            sunsetLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunsetLabelView.heightAnchor.constraint(equalToConstant: fontSize * 1.2),
            sunsetLabelView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 10),
        ])
    }
    
    private func configureCurrentWeatherDiscriptor() {
        let fontSize: CGFloat               = 18
        weatherDetailsLabel                 = WMTitleLabel(textAlignment: .center, fontSize: fontSize)
        view.addSubview(weatherDetailsLabel)
        
        let padding: CGFloat                = 45
        
        NSLayoutConstraint.activate([
            weatherDetailsLabel.topAnchor.constraint(equalTo: currentWeatherContainerView.bottomAnchor, constant: padding),
            weatherDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDetailsLabel.heightAnchor.constraint(equalToConstant: fontSize * 1.2),
            weatherDetailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 10)
        ])
    }
    
    private func configureWeatherContainer() {
        let diametr                         = view.frame.height * 0.3
        
        currentWeatherContainerView         = WMWeatherContainerView(radious: diametr / 2)
        view.addSubview(currentWeatherContainerView)
        
        let padding: CGFloat                = 25
        
        NSLayoutConstraint.activate([
            currentWeatherContainerView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: padding),
            currentWeatherContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentWeatherContainerView.heightAnchor.constraint(equalToConstant: diametr),
            currentWeatherContainerView.widthAnchor.constraint(equalTo: currentWeatherContainerView.heightAnchor),
        ])
    }
    
    private func configureCityLabel() {
        let fontSize: CGFloat           = 20
        cityNameLabel                   = WMSecondaryTitleLabel(textAlignment: .left, fontSize: fontSize)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityNameLabel)
        
        let padding: CGFloat            = 5
        let leftPadding: CGFloat        = 30
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: padding),
            cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPadding),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cityNameLabel.heightAnchor.constraint(equalToConstant: fontSize+2)
        ])
    }
    
    private func configureDateLabel() {
        let fontSize: CGFloat           = 45
        currentDateLabel                = WMTitleLabel(textAlignment: .left, fontSize: 45)
        currentDateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentDateLabel)
        
        let padding: CGFloat            = 5
        let leftPadding: CGFloat        = 28
        
        NSLayoutConstraint.activate([
            currentDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            currentDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPadding),
            currentDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            currentDateLabel.heightAnchor.constraint(equalToConstant: fontSize+4 )
        ])
    }
    
    private func configureButton() {
        forecastButton = WMButton(backgroundColor: .label, title: "Weather Forecast")
        forecastButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forecastButton)
        
        forecastButton.addTarget(self, action: #selector(showWeatherForecsast), for: .touchUpInside)
        
        let padding: CGFloat            = 20
        let height: CGFloat             = 50
                
        NSLayoutConstraint.activate([
            forecastButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            forecastButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            forecastButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            forecastButton.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    @objc private func showWeatherForecsast() {
        tabBarController?.selectedIndex = 1
    }
    
    private func setGradient() {
        let layer                       = CAGradientLayer()
        layer.frame                     = view.bounds
        layer.startPoint                = CGPoint(x: 0,y: 0)
        layer.endPoint                  = CGPoint(x: 1,y: 1)
        layer.colors                    = [UIColor.systemTeal.cgColor,
                                           UIColor.systemBlue.cgColor,
                                           UIColor.systemGray.cgColor]
        view.layer.addSublayer(layer)
    }
}

extension CurrentTempratureVC: UserLocationDelegate {
    
    func locationManagerDoesNotHavePermissions() {
        if currentWeatherContainerView != nil {
            currentWeatherContainerView.removeFromSuperview()
        }
        
        self.showEmptyStateView(with: WMConstants.forecastScreenNoLocationPermission.rawValue)
    }
    
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
                self.presentGFAlertOnMainThread(title: "OOPS  🚧",
                                                message: "\(error.rawValue)",
                                                buttonTitle: "OK")
                
                let placeholderUI       = CurrentWeatherViewModel()
                self.viewModel          = placeholderUI
                
            case .success(let data):
                self.viewModel          = CurrentWeatherViewModel(currentWeather: data)
            }
            
            self.updateUI(with: self.viewModel)
        }
    }
}
