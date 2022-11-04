//
//  Forecast.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 9/22/22.
//

import Foundation

struct Forecast: Codable {
    struct Daily: Codable {
        let dt: Date
        let sunrise: Date
        let sunset: Date
        
        struct Temp: Codable {
            let min: Double
            let max: Double
        }
        let temp: Temp
       
        struct Weather: Codable {
           
            let description: String
            let icon: String
        }
        let weather: [Weather]
       
    }
    let daily: [Daily]
}

