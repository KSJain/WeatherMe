//
//  ForecastWeatherViewModel.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

struct Forecast{
    var date: String?
    var time: String?
    var icon: String
    var temprature: String
}

struct ForecastWeatherViewModel {
    var forecasts = [Forecast]()
    let city: String
    
    init(with forecastWeather: ForecastWeather) {
        city = forecastWeather.city.name.isEmpty ? "Your City" : forecastWeather.city.name
        
        let forecastList = forecastWeather.list
        forecastList.forEach {
            
            let unixDate        = Double($0.dt)
            let forecastDate    = unixDate.convertUnixToDate()
            let date            = forecastDate?.convertDateToDayMonthDate()
            let time            = forecastDate?.convertDateToTimeAMPM()
            
            let icon: String    = $0.weather.first?.icon ?? ""
            
            let temp            = $0.main.temp.convertKelvinToFahrenheit()
            
            let forecast        = Forecast(date: date,
                                           time: time,
                                           icon: icon,
                                           temprature: temp)
            
            self.forecasts.append(forecast)
        }
    }
}
