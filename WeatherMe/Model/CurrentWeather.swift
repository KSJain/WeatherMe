//
//  CurrentWeather.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let timezone: String
    let current: CurrentVectors
}

// MARK: - CurrentVectors
struct CurrentVectors: Codable {
    let humidity: Int
    let currentDate: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let weather: [WeatherData]

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, temp, humidity, weather
        case currentDate = "dt"
        case feelsLike = "feels_like"
    }
}

// MARK: - WeatherData
struct WeatherData: Codable {
    let icon: String
    let description: CurrentWeatherDescription
}

// MARK: - CurrentWeatherDescription
enum CurrentWeatherDescription: String, Codable {
    case brokenClouds       = "broken clouds"
    case clearSky           = "clear sky"
    case fewClouds          = "few clouds"
    case lightRain          = "light rain"
    case overcastClouds     = "overcast clouds"
    case scatteredClouds    = "scattered clouds"
}
