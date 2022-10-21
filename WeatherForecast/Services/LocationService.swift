//
//  LocationService.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import Foundation
import MapKit
import os


final class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    enum Status {
        case waiting
        case available
        case denied
    }
    
    private let locationManager = CLLocationManager()
    
    @Published var status = Status.waiting
    @Published var lastLocation: CLLocation? = nil
    @Published var lastTitle: String = ""
    
    func start() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       
        if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
            if let location = manager.location {
                geocode(location: location)
            } else {
                status = .waiting // isn't really available yet
                manager.startUpdatingLocation()
            }
        } else if manager.authorizationStatus == .denied || manager.authorizationStatus == .restricted {
            status = .denied
        }
        
       
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager has failed with error: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            geocode(location: location)
            
            manager.stopUpdatingLocation()
        }
    }
    
   
    
    private func geocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Could not determine 'place' for current location: \(error.localizedDescription)")
                self.lastLocation = location
                self.lastTitle = "Current Location".localized()
                self.status = .available
            }
            if let placemarks = placemarks {
                self.lastLocation = location
                self.lastTitle = placemarks.first?.name ?? "Current Location".localized()
                self.status = .available
            }
        }
    }
}

