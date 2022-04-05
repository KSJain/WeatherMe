//
//  AppCoordinator.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/5/22.
//  Copyright © 2022 com.devKrey. All rights reserved.
//

import UIKit

class  AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func eventOccoured(with type: Event) {
        switch type {
        case .buttonTapped:
            let forecastVC: UIViewController & Coordinating = WeatherForecastViewController()
            forecastVC.coordinator = self
            navigationController?.pushViewController(forecastVC, animated: true)
        }
    }
    
    func start() {
        let vc: UIViewController & Coordinating = CurrentWeatherViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
}
