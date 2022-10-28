//
//  DataStore.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/25/22.
//


import Foundation

class DataStore: ObservableObject {
    @Published var name = ""
   
    
    var isDisabled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init(_ weather:WeatherResponse) {
        self.name = weather.name
       
    }
}

