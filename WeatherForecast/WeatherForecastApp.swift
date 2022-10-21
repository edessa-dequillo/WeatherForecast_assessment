//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/9/22.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    @Environment(\.scenePhase) private var scenePhase
    let persistenceController = PersistenceController.shared
    
    @StateObject var appController = AppController()
    
    var isDay: Bool {
        appController.weatherData?.isDay() ?? true
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appController)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    (isDay ? Color.dayLight : Color.nightLight)
                        .edgesIgnoringSafeArea(.all))
        }
        
      
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                self.appController.refreshWeatherData()
            default:
               
                break
            }
        }
    }
}
