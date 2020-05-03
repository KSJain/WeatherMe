//
//  CurrentWeatherTest.swift
//  WeatherMeTests
//
//  Created by Kartikeya Saxena Jain on 5/2/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import XCTest

class CurrentWeatherTest: XCTestCase {
    
    var weatherData: WeatherData!
    var currentVectors: CurrentVectors!
    var currentWeatherData: CurrentWeather!
    
    var viewModel: CurrentWeatherViewModel!

    func testViewModelIdealTest() throws {
        weatherData         = WeatherData(icon: "02d", description: .clearSky)
        currentVectors      = CurrentVectors(humidity: 10,
                                             currentDate: 1588449837,
                                             sunrise: 1588449837,
                                             sunset: 1588449837,
                                             temp: 60,
                                             feelsLike: 55,
                                             weather: [weatherData])
        currentWeatherData  = CurrentWeather(timezone: "Country/TestCity", current: currentVectors)
        
        viewModel           = CurrentWeatherViewModel(currentWeather: currentWeatherData)
        
        XCTAssertEqual(viewModel.date, "Sat, May 02")
        XCTAssertEqual(viewModel.sunset, "Sunset    04:03 PM")
        XCTAssertEqual(viewModel.sunrise, "Sunrise   04:03 PM")
        XCTAssertEqual(viewModel.humidity, "10 %")
        XCTAssertEqual(viewModel.timeZone, "TestCity Weather")
        XCTAssertEqual(viewModel.feelsLike, "Feels -360.7°F")
        XCTAssertEqual(viewModel.temperature, "-351.7°F")
        XCTAssertEqual(viewModel.weatherIconName, "02d")
        XCTAssertEqual(viewModel.currentWeatherDiscription, "CLEAR SKY")
    }
    
    func testViewModelWrongDataTest() throws {
        weatherData         = WeatherData(icon: "", description: .clearSky)
        currentVectors      = CurrentVectors(humidity: 0,
                                             currentDate: 000,
                                             sunrise: -11,
                                             sunset: 123,
                                             temp: 60,
                                             feelsLike: 55,
                                             weather: [weatherData])
        currentWeatherData  = CurrentWeather(timezone: "TestCity", current: currentVectors)
        
        viewModel           = CurrentWeatherViewModel(currentWeather: currentWeatherData)
        
        XCTAssertEqual(viewModel.timeZone, "Your Weather")
        XCTAssertEqual(viewModel.weatherIconName, "")
    }
    
}
