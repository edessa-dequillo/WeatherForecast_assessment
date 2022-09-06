//
//  API.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import Foundation

struct API {
    struct Urls {
        static func weatherByCity(city: String) -> URL? {
            return URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=4de22a83df9283b2abe389f4a4da7164&units=metric")
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
