//
//  CurrentWeatherViewController.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/5/22.
//  Copyright © 2022 com.devKrey. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Current Weather"
        view.backgroundColor = .systemOrange
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        
        button.center = view.center
        button.backgroundColor = .systemGray
        button.setTitle("Tap Here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        coordinator?.eventOccoured(with: .buttonTapped)
    }
}
