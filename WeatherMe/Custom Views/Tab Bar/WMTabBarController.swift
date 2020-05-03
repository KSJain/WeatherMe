//
//  WMTabBarController.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit

class WMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemTeal
        viewControllers                 = [createCurrentWeatherNC(), createForecastWeatherNC()]
    }
    
    
    func createCurrentWeatherNC() -> UINavigationController {
        let currentVC           = CurrentTempratureVC()
        currentVC.title         = "Weather Now"
        currentVC.tabBarItem    = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        return UINavigationController(rootViewController: currentVC)
    }
    
    
    func createForecastWeatherNC() -> UINavigationController {
        let forecastVC          = ForecastWeatherVC()
        forecastVC.title        = "5 Day Forecast"
        forecastVC.tabBarItem   = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        return UINavigationController(rootViewController: forecastVC)
    }
}
