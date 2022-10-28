//
//  ContentView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/9/22.
//


import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var appController: AppController
    
    @State private var showSheet = false
    
    struct ForecastContent: View {
        @EnvironmentObject var appController: AppController
        var weatherData: WeatherData
        var action: () -> Void
        var body: some View {
            VStack(alignment: .center, spacing: 0) {
                ContentViewHeader(title: self.appController.locationTitle) {
                    self.action()
                }
                ForecastView(weatherData: weatherData)
            }
        }
    }
    
    struct SelectLocationContent: View {
        @EnvironmentObject var appController: AppController
        var action: () -> Void
        var body: some View {
            VStack {
                WelcomeView()
                if !appController.locationAvailable {
                    Button("Select Location") {
                        self.action()
                    }.padding()
                }
            }
        }
    }
    
    var body: some View {
        Group {
            if let weatherData = self.appController.weatherData {
                ForecastContent(weatherData: weatherData, action: {
                    self.showSheet.toggle()
                })
            } else {
                SelectLocationContent(action: {
                    self.showSheet.toggle()
                })
            }
        }
      
    .foregroundColor(.white)
        .sheet(isPresented: self.$showSheet, content: {
            LocationSearchView()
                .environment(\.managedObjectContext, viewContext)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
