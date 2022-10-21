//
//  AppController.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import Foundation
import MapKit
import Combine
import UIKit

final class AppController: NSObject, ObservableObject {
    
    private var weatherService = WeatherService()
    private var locationService = LocationService()
    private var locationSink: AnyCancellable?
    private var units = WeatherService.WeatherUnits.imperial
    
    @Published var locationAvailable = false
    @Published var location: CLLocation? = nil
    @Published var locationTitle = "Current Location".localized()
    @Published var weatherData: WeatherData?
  //  @Published var hourlyData: [HourlyData]?
    @Published var errorMessage: String?
    
    var isMetric: Bool { units == .metric }
    
    override init() {
        super.init()
        
     
        locationSink = locationService.$status.sink { (newStatus) in
            self.locationAvailable = newStatus == .available
            if self.locationAvailable {
                self.updateCurrentLocation()
            }
        }
        
        locationService.start()
    }
    
    func updateCurrentLocation() {
        updateCurrentLocation(with: locationService.lastLocation, title: locationService.lastTitle)
    }
    
    func updateCurrentLocation(with item: MKMapItem) {
        guard let title = item.placemark.title else { return }
        updateCurrentLocation(with: item.placemark.location, title: title)
    }
    
    func updateCurrentLocation(with newLocation: CLLocation?, title: String) {
        guard let location = newLocation else { return }
        weatherService.getAllWeatherInfo(for: location.coordinate, units: units) { allData in
            if let allData = allData {
                self.weatherData = allData
                self.locationTitle = title
                self.location = location
              //  self.prepareHourlyData()
            } else {
                self.weatherData = nil
                self.errorMessage = "Unable to get any weather Data"
            }
        }
    }
    
    func refreshWeatherData() {
        updateCurrentLocation(with: location, title: locationTitle)
    }
    
    func changeUnits(isImperial: Bool) {
        units = isImperial ? .imperial : .metric
        refreshWeatherData()
    }
    
//    struct HourlyData: Identifiable {
//        var id: Int
//        var hour: String
//        var temp: String
//        var tempHeight: CGFloat
//        var rain: String
//        var rainHeight: CGFloat
//    }
    
    
//    private func prepareHourlyData() {
//        var result = [HourlyData]()
//        guard let data = weatherData?.hourly?[..<10] else { return }
//
//
//        let minTemp = (data.min { ($0.temp ?? 0) < ($1.temp ?? 0) }?.temp ?? 0) - (isMetric ? 2 : 10)
//        let maxTemp = (data.max { ($0.temp ?? 0) < ($1.temp ?? 0) }?.temp ?? 0) + (isMetric ? 2 : 10)
//
//        for index in 0..<min(10,data.count) {
//            let datum = data[index]
//            let temp = datum.temp ?? 0
//            let date = Date(timeIntervalSince1970: datum.dt ?? 0)
//            let rain = min(CGFloat(datum.rain?["1h"] ?? 0), 1)
//            let hd = HourlyData(
//                id: index,
//                hour: date.formattedHour(),
//                temp: String(format: "%.0f°", (datum.temp ?? 0)),
//                tempHeight: CGFloat((temp - minTemp) / (maxTemp - minTemp)),
//                rain: String(format: "%.0f%%", (rain * 100)),
//                rainHeight: rain
//            )
//            result.append(hd)
//        }
//
//        self.hourlyData = result
//    }
}

