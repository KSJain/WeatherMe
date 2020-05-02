//
//  CurrentWeatherViewModel.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

struct CurrentWeatherViewModel {
    let date: String
    let sunset: String
    let sunrise: String
    let humidity: String
    let timeZone: String
    let feelsLike: String
    let temperature: String
    let weatherIconName: String
    let currentWeatherDiscription: String
    
    init(currentWeather: CurrentWeather) {
        // Time Zone
        let localTZ                     = currentWeather.timezone.split(separator: "/")
        let timeZoneTitle               = localTZ.count == 2 ? "\(localTZ[1]) Weather" : "Your Weather"
        self.timeZone                   = timeZoneTitle
        
        
        // Date
        let dateTimeInterval            = Double(currentWeather.current.currentDate)
        let currentDate                 = dateTimeInterval.convertUnixToDate()
        self.date                       = currentDate?.convertDateToDayMonthDate() ?? ""
        
        let sunsetTimeInterval          = Double(currentWeather.current.sunset)
        let sunsetDate                  = sunsetTimeInterval.convertUnixToDate()
        self.sunset                     = sunsetDate?.convertDateToTimeAMPM() ?? ""
        
        let sunriseTimeInterval         = Double(currentWeather.current.sunrise)
        let sunriseDate                 = sunriseTimeInterval.convertUnixToDate()
        self.sunrise                    = sunriseDate?.convertDateToTimeAMPM() ?? ""
            
            
        // Temprature
        self.temperature                = currentWeather.current.temp.convertKelvinToFahrenheit()
        self.feelsLike                  = currentWeather.current.feelsLike.convertKelvinToFahrenheit()
        self.humidity                   = "\(currentWeather.current.humidity) %"
        
        
        // Details
        self.weatherIconName            = currentWeather.current.weather.first?.icon ?? "01d"
        self.currentWeatherDiscription  = currentWeather.current.weather.first?.description.rawValue.uppercased() ?? ""
    }
}
