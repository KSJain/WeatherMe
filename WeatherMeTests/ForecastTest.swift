//
//  ForecastTest.swift
//  WeatherMeTests
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import XCTest

class ForecastTest: XCTestCase {

    var viewModel: ForecastWeatherViewModel?
    var forecastWeather: ForecastWeather?
    var vector: Vector?
    var temperature: Temperature?
    var weather: Weather?
    var city: City?
    
    func testViewModelHappyPath() throws {
        temperature     = Temperature(temp: 200)
        weather         = Weather(icon: "03d")
        vector          = Vector(dt: 1588449837, main: temperature!, weather: [weather!])
        city            = City(name: "Test City")
        forecastWeather = ForecastWeather(list: [vector!, vector!], city: city!)
        
        viewModel       = ForecastWeatherViewModel(with: forecastWeather!)
        
        guard let viewModel = viewModel else { return }
        XCTAssertEqual(viewModel.city, "Test City")
        XCTAssertEqual(viewModel.forecasts.count, 2)
        
        XCTAssertEqual(viewModel.forecasts.first?.date!, "Sat, May 02")
        XCTAssertEqual(viewModel.forecasts.first?.time!, "04:03 PM")
        XCTAssertEqual(viewModel.forecasts.first?.icon, "03d")
        XCTAssertEqual(viewModel.forecasts.first?.temprature, "-99.7°F")
        
    }
    
    func testViewModelWrongForecastData() throws {
        temperature     = Temperature(temp: 200)
        weather         = Weather(icon: "")
        vector          = Vector(dt: 0, main: temperature!, weather: [weather!])
        city            = City(name: "")
        forecastWeather = ForecastWeather(list: [vector!, vector!], city: city!)
        
        viewModel       = ForecastWeatherViewModel(with: forecastWeather!)
        
        guard let viewModel = viewModel else { return }
        XCTAssertEqual(viewModel.city, "Your City")
        XCTAssertEqual(viewModel.forecasts.first?.icon, "")
    }
}
