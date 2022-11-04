//
//  ForecastViewModel.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 9/22/22.
//

import Foundation

struct ForecastViewModel {
    let forecast: Forecast.Daily
    var system: Int
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    private static var numberFormatter2: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }

    func convert(_ temp: Double) -> Double {
        let celsius = temp - 273.5
        if system == 0 {
            return celsius
        } else {
            return celsius * 9 / 5 + 32
        }
    }
    var day: String {
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var overview: String {
        forecast.weather[0].description.capitalized
    }
    
    var high: String {
        return "Max: \(Self.numberFormatter.string(for: convert(forecast.temp.max)) ?? "0")°"
    }
    
    var low: String {
        return "Min: \(Self.numberFormatter.string(for: convert(forecast.temp.min)) ?? "0")°"
    }
    var icon: String {
         forecast.weather[0].icon
    }
    var sunrise: Date {
        return forecast.sunrise
    }
    
    var sunset: Date {
        return forecast.sunset
    }
    

   
}


