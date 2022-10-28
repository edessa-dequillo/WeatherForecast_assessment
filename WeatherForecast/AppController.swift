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
    

}

