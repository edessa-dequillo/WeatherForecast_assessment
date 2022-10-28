//
//  FileManager.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/25/22.
//

import Foundation

let fileName = "AddWeather.json"

extension FileManager {
    static var dataDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveData(contents: String, dataName: String, completion: (Error?) -> Void) {
        let url = Self.dataDirURL.appendingPathComponent(dataName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    
    func readData(dataName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.dataDirURL.appendingPathComponent(dataName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func dataExist(named dataName: String) -> Bool {
        fileExists(atPath: Self.dataDirURL.appendingPathComponent(dataName).path)
    }
}
