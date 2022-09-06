//
//  WeatherDataViewModel.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import Foundation

class WeatherDataViewModel: ObservableObject {
    
    var city: String = ""
    
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        
        WeatherFetcher().getWeatherByCity(city: city) { (result) in
            switch result {
            case.success(let weather):
                DispatchQueue.main.async {
                completion(WeatherViewModel(weather: weather))
            }
            case.failure(let error):
                print(error)
            }
        }
        
        
    }
}
