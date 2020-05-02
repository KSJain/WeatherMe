//
//  ForecastWeather.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

// MARK: - WeatherForecast
struct ForecastWeather: Codable {
    let list: [Vector]
    let city: City
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - List
struct Vector: Codable {
    let dt: Int
    let main: Temperature
    let weather: [Weather]
}

// MARK: - MainClass
struct Temperature: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let icon: String

}
