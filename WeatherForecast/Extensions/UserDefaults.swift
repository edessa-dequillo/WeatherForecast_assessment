//
//  UserDefaults.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import Foundation


extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .celsius
        }
        return TemperatureUnit(rawValue: value) ?? .celsius
    }
    
   
}
