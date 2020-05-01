//
//  Errors.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 5/1/20.
//  Copyright © 2020 com.devKrey. All rights reserved.
//

import Foundation

// MARK: - Error
enum WMNetworkError: String, Error {
    case badURL         = "Please make sure Location information is correct"
    case badData        = "We got the data for you but it was unreliable."
    case urlError       = "There was a network related error."
    case badResponse    = "The network response  code was invalid."
    case decodeError    = "We tried to get the data you needed, but failed."
}
