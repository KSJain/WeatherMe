//
//  WeatherForecastCoordinator.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/5/22.
//  Copyright © 2022 com.devKrey. All rights reserved.
//

import UIKit

class WeatherForecastCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func eventOccoured(with type: Event) {
        
    }
    
    func start() {
        let weatherForecastVC: UIViewController & Coordinating = WeatherForecastViewController()
        weatherForecastVC.coordinator = self
        
        navigationController?.setViewControllers([weatherForecastVC], animated: false)
    }
}
