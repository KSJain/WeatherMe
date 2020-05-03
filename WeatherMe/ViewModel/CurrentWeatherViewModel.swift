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
    let title           = "Current Weather"
    
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
        let sunsetText                  = sunsetDate?.convertDateToTimeAMPM() ?? "--:--"
        self.sunset                     = "Sunset    \(sunsetText)"
        
        let sunriseTimeInterval         = Double(currentWeather.current.sunrise)
        let sunriseDate                 = sunriseTimeInterval.convertUnixToDate()
        let sunriseText                 = sunriseDate?.convertDateToTimeAMPM() ?? "--:--"
        self.sunrise                    = "Sunrise   \(sunriseText)"
            
            
        // Temprature
        self.temperature                = currentWeather.current.temp.convertKelvinToFahrenheit() + "°F"
        let feelsLikeText               = "Feels \(currentWeather.current.feelsLike.convertKelvinToFahrenheit())" + "°F"
        self.feelsLike                  = feelsLikeText
        self.humidity                   = "\(currentWeather.current.humidity) %"
        
        
        // Details
        self.weatherIconName            = currentWeather.current.weather.first?.icon ?? "01d"
        self.currentWeatherDiscription  = currentWeather.current.weather.first?.description.rawValue.uppercased() ?? ""
    }
    
    init() {
        self.timeZone                   = "Cupertino"
        
        self.sunset                     = "Sunset    --:--"
        self.sunrise                    = "Sunrise   --:--"
        self.date                       = "Fri May 02"
        
        self.temperature                = "58°F"
        self.feelsLike                  = "Feels 58°F"
        self.humidity                   = "25%"
        
        self.weatherIconName            = WMImages.img11d.rawValue
        self.currentWeatherDiscription  = "Scattered Clouds"
    }
}
