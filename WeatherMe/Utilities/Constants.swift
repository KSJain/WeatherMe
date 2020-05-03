//
//  Constants.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import UIKit

// MARK: - API Key
public enum WMConstants: String {
    case weatherMapAPIKey                       = "8a1989ec10b68a04dc898bd1ab284f96"
    case forecastScreenNoLocationPermission     = "Location Permissions are 🚫 Disabled 😭. Please enable them in your device settings ⚙️."
    case noForecastData                         = "App does not have any  ⛅️ forecasts to show at this momoent. Please check back later ⏳."
}

// MARK: - Image Name


enum WMImages: String {
    static let emptyStateLogo                   =  UIImage(named: "emptyStateLogo")
    
    case img01d                                 = "01d"
    case img01n                                 = "01n"
    static let clearSkyDayIcon                  = UIImage(named: "01d")
    static let clearSkyNightIcon                = UIImage(named: "01n")
    
    case img02d                                 = "02d"
    case img02n                                 = "02n"
    static let fewCloudsDayIcon                 = UIImage(named: "02d")
    static let fewCloudsNightIcon               = UIImage(named: "02n")
    
    case img03d                                 = "03d"
    case img03n                                 = "03n"
    static let scatteredCloudsDayIcon           = UIImage(named: "03d")
    static let scatteredCloudsNightIcon         = UIImage(named: "03n")
    
    case img04d                                 = "04d"
    case img04n                                 = "04n"
    static let brokenCloudsDayIcon              = UIImage(named: "04d")
    static let brokenCloudsNightIcon            = UIImage(named: "04n")
    
    case img09d                                 = "09d"
    case img09n                                 = "09n"
    static let showerDayIcon                    = UIImage(named: "09d")
    static let showerNightIcon                  = UIImage(named: "09n")
    
    case img10d                                 = "10d"
    case img10n                                 = "10n"
    static let rainDayIcon                      = UIImage(named: "10d")
    static let rainNightIcon                    = UIImage(named: "10n")
    
    case img11d                                 = "11d"
    case img11n                                 = "11n"
    static let thunderstormCloudsDayIcon        = UIImage(named: "11d")
    static let thunderstormCloudsNightIcon      = UIImage(named: "11n")
    
    case img13d                                 = "13d"
    case img13n                                 = "13n"
    static let snowCloudsDayIcon                = UIImage(named: "13d")
    static let snowCloudsNightIcon              = UIImage(named: "13n")
    
    case img50d                                 = "50d"
    case img50n                                 = "50n"
    static let mistDayIcon                      = UIImage(named: "50d")
    static let mistNightIcon                    = UIImage(named: "50n")
}

// MARK:- Scree Sixe Constanyts
enum ScreenSize {
    static let width                            = UIScreen.main.bounds.size.width
    static let height                           = UIScreen.main.bounds.size.height
    static let maxLength                        = max(ScreenSize.width, ScreenSize.height)
    static let minLength                        = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    static let idiom                            = UIDevice.current.userInterfaceIdiom
    static let nativeScale                      = UIScreen.main.nativeScale
    static let scale                            = UIScreen.main.scale

    static let isiPhoneSE                       = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard                = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed                  = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard            = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed              = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX                        = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr               = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                           = idiom == .pad && ScreenSize.maxLength >= 1024.0

    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
