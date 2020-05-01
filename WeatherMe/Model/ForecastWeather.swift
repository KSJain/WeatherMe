//
//  ForecastWeather.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

// MARK: - ForecastWeather
struct ForecastWeather: Codable {
    let cod: String
    let message, cnt: Int
    let list: [DailyForecast]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coordinates
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lon: Double
}

// MARK: - DailyForecast - List
struct DailyForecast: Codable {
    let dt: Int
    let main: ForecastVectors
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dtTxt: String
    let rain: Rain?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - ForecastVectors
struct ForecastVectors: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: DayType
    let description: WeatherDescription
    let icon: String
}

// MARK: - DayType
enum DayType: String, Codable {
    case clear              = "Clear"
    case clouds             = "Clouds"
    case rain               = "Rain"
}

// MARK: - WeatherDescription
enum WeatherDescription: String, Codable {
    case brokenClouds       = "broken clouds"
    case clearSky           = "clear sky"
    case lightRain          = "light rain"
    case overcastClouds     = "overcast clouds"
    case scatteredClouds    = "scattered clouds"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
