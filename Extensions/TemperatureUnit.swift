//
//  TemperatureUnit.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/17/22.
//

import Foundation

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
           
        }
    }
}
