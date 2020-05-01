//
//  NetworkManager.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation
import CoreLocation

class NetworkManager {
    public static var shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://api.openweathermap.org/data/2.5"
        
    
    func getCurrentWeatherForUsersLocation(coordinates location: CLLocationCoordinate2D, completion: @escaping (Result<CurrentWeather, WMNetworkError>) -> Void) {
        
        let endpoint = baseURL + "/onecall?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(WNConstants.weatherMapAPIKey.rawValue)"

        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { oData, oResponse, oError in
            if oError != nil {
                completion(.failure(.urlError))
                return
            }
            
            guard let response = oResponse as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let jsonData = oData else {
                completion(.failure(.badData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let weatherData = try decoder.decode(CurrentWeather.self, from: jsonData)
                completion(.success(weatherData))
                
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
    }
    
    
    func getForecastWeatherForUsersLocation(coordinates location: CLLocationCoordinate2D, completion: @escaping (Result<ForecastWeather, WMNetworkError>) -> Void) {
        
        let endpoint = baseURL + "/forecast?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(WNConstants.weatherMapAPIKey.rawValue)"
        //https://api.openweathermap.org/data/2.5/forecast?lat=42.23880060139691&lon=-83.2362027770297&appid=8a1989ec10b68a04dc898bd1ab284f96
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { oData, oResponse, oError in
            if oError != nil {
                completion(.failure(.urlError))
                return
            }
            
            guard let response = oResponse as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let jsonData = oData else {
                completion(.failure(.badData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let weatherData = try decoder.decode(ForecastWeather.self, from: jsonData)
                completion(.success(weatherData))
                
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
    }
    
}
