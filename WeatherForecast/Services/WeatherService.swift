//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI
import MapKit
import Combine


class WeatherService {
    
    enum WeatherUnits: String {
        case imperial = "imperial"
        case metric = "metric"
    }
    
    private let apiKey = "4de22a83df9283b2abe389f4a4da7164"
    
    private var subscriptions = Set<AnyCancellable>()
        
    func getAllWeatherInfo(for location: CLLocationCoordinate2D, units: WeatherUnits, onComplete: @escaping ((WeatherData?)->Void)) {
        let lat = location.latitude
        let lon = location.longitude
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,alerts&units=\(units.rawValue)&appid=\(apiKey)") else { return }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .sink { completion in
                
                if case .failure(let err) = completion {
                    print("Retrieving data from weather service received this error: \(err)")
                    onComplete(nil)
                }
                
            } receiveValue: { object in
                
                DispatchQueue.main.async {
                    onComplete(object)
                }
            }
            .store(in: &subscriptions)
    }
    
}


