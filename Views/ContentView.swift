//
//  ContentView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/9/22.
//

import SwiftUI
import MapKit
import Combine

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion.defaultRegion
    @State private var cancellable: AnyCancellable?
    @State var showMainView: Bool = false
    @ObservedObject var weatherVM = WeatherDataViewModel()


    
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
    
    var body: some View {
        
        VStack {
            if showMainView {
                MainView(weatherVM: WeatherDataViewModel())
                        } else {
                            Button("Continue") {
                                self.showMainView = true
                            }
                        }
                    
            VStack {
                if locationManager.location != nil {
                    
                } else {
                    Text("Locating user location...")
                }
            }
        }
      .embedInNavigationView()
            .onAppear {
                setCurrentLocation()
        }
        }
        
       
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
