//
//  WeatherForecastViewController.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/5/22.
//  Copyright © 2022 com.devKrey. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forecast"
        view.backgroundColor = .systemBrown
    }

}
