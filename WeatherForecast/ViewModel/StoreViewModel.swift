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
    @Published var showWeatherList: Bool = false
    
    init() {
        selectedUnit = UserDefaults.standard.unit
        print(FileManager.dataDirURL.path)
        if FileManager().dataExist(named: fileName){
            loadWeather()
        }
       
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
        saveWeather()
    }
    
    func updateWeather(_ weather: WeatherViewModel) {
        guard let index = weatherList.firstIndex(where: { $0.id == weather.id}) else { return }
        weatherList[index] = weather
        saveWeather()
    }
    
    func deleteWeather(at indexSet: IndexSet) {
        weatherList.remove(atOffsets: indexSet)
        saveWeather()
    }
    
    func loadWeather() {
        FileManager().readData(dataName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    weatherList = try decoder.decode([WeatherViewModel].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveWeather() {
        print("Saving weatherList to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(weatherList)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveData(contents: jsonString, dataName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

