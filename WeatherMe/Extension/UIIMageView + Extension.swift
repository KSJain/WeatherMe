//
//  UIIMageView + Extension.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImageFor(name: String) {
        if name.isEmpty  { return }
        image = UIImage(named: name)
    }
}
