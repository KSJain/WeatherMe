//
//  Coordinator.swift
//  WeatherMe
//
//  Created by Kartikeya Saxena Jain on 4/5/22.
//  Copyright © 2022 com.devKrey. All rights reserved.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccoured(with type: Event)
    func start()
}

protocol Coordinating: AnyObject {
    var coordinator: Coordinator? { get set }
}
