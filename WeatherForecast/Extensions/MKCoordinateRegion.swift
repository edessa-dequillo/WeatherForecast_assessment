//
//  MKCoordinateRegion.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/16/22.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 10.778253, longitude: 122.978629), latitudinalMeters: 100, longitudinalMeters: 100)
    }
    
}
