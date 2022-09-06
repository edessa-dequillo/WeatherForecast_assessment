//
//  WeatherFetcher.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/10/22.
//
import Foundation

enum NetworkError: Error {
    case badURL
    case noData
}

class WeatherFetcher {
    
    func getWeatherByCity(city: String, completion: @escaping ((Result<Weather, NetworkError>) -> Void)) {
        
        guard let weatherURL = API.Urls.weatherByCity(city: city) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse.weather))
            }
            
        }.resume()
    }
    
}
