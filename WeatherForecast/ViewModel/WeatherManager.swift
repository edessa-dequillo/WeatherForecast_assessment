//
//  WeatherManager.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/9/22.
//

import SwiftUI

class WeatherManager: ObservableObject {
    
    @Published var fetchedWeather: [Weather] = []
    @Published var isLoading: Bool = false
    
    init() {
        
    }
    
    func getWeather() {
        
        self.isLoading = true
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=10.778253&lon=122.97862&appid=4de22a83df9283b2abe389f4a4da7164")
    }
}

