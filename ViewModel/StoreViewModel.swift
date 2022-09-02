//
//  StoreViewModel.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import Foundation

class StoreViewModel: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .celsius
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    init() {
        selectedUnit = UserDefaults.standard.unit
        
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
    //func deleteWeather(_ weather: WeatherViewModel) {
     //   weatherList.removeAll()
   // }
}

