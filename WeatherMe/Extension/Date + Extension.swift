//
//  Date + Extension.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

extension Date {
    
    func convertDateToDayMonthDate() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "EEE, MMM dd"
        return dateFormatter.string(from: self)
    }
    
    func convertDateToTimeAMPM() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "hh:mm a"
        return dateFormatter.string(from: self)
    }
}
