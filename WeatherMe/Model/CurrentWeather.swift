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
    let lat, lon: Double
    let timezone: String
    let current: CurrentVectors
    let hourly: [Hourly]
    let daily: [Daily]
}

// MARK: - CurrentVectors
struct CurrentVectors: Codable {
    let windDeg: Int
    let pressure, humidity: Int
    let clouds, visibility: Int
    let dt, sunrise, sunset: Int
    let windSpeed: Double
    let dewPoint, uvi: Double
    let temp, feelsLike: Double
    let rain: CurrentRain
    let weather: [WeatherData]
}

// MARK: - CurrentRain
struct CurrentRain: Codable {
}

// MARK: - WeatherData
struct WeatherData: Codable {
    let id: Int
    let main: CurrentDayType
    let description: CurrentWeatherDescription
    let icon: String
}

// MARK: - CurrentDayType
enum CurrentDayType: String, Codable {
    case clear              = "Clear"
    case clouds             = "Clouds"
    case rain               = "Rain"
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

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [WeatherData]
    let clouds: Int
    let uvi: Double
    let rain: Double?
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint: Double
    let clouds: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherData]
    let rain: HourlyRain?
}

// MARK: - HourlyRain
struct HourlyRain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

