//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import Foundation

struct WeatherViewModel {
    
    let weather: Weather
    
    let id = UUID()
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
        switch unit {
        case.celsius:
            return weather.temperature
        case.fahrenheit:
            return weather.temperature * 1.8 + 32
        }
    }
    
    var temperature: Double {
        return weather.temperature
    }
    
    var city: String {
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date {
        return weather.sunset
    }
}
