//
//  Double + Extension.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

extension Double {
    func convertKelvinToFahrenheit() -> String {
        let kTemp               = self
        let fTemp               = (kTemp - 273.15) * 9/5 + 32
        let tempStr             = String(format: "%.1f", fTemp)
        return tempStr
    }
    
    func convertUnixToDate() ->  Date? {
        let date = Date(timeIntervalSince1970: self)
        return date
    }
}
