//
//  ForecastView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct ForecastView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var appController: AppController
    
    var weatherData: WeatherData
    
    let forecastColumns = [ GridItem(.flexible(minimum: 80)) ]
    
   
    var body: some View {
        if horizontalSizeClass == .compact {
            return AnyView(verticalLayout)
        } else {
            return AnyView(horizontalLayout)
        }
    }
    
    var eightDayForecast: some View {
        Group {
            if let dailyWeather = weatherData.daily {
                LazyVGrid(columns: forecastColumns) {
                    ForEach(0..<dailyWeather.count, id: \.self) { index in
                        ForecastRowView(dailyWeather: dailyWeather[index])
                            .padding([.top, .bottom], 5)
                    }
                }
            } else {
                EmptyView()
            }
        }
    }
    
    
    var horizontalLayout: some View {
        GeometryReader { proxy in
            HStack(alignment: .center) {
                    
                if weatherData.current != nil {
                    CurrentConditionsView(weatherData: weatherData, proxy: proxy)
                }
                    
                ScrollView(.vertical, showsIndicators: false) {
                    
//                    if let hourlyData = appController.hourlyData {
//                        TabView {
//                            HourlyTemperatureView(hourlyData: hourlyData)
//                            HourlyRainView(hourlyData: hourlyData)
//                        }
//                        .tabViewStyle(PageTabViewStyle())
//                        .frame(height: 200)
//                    }
                    
                    eightDayForecast
                }
                .padding([.leading, .trailing], 10)
            }
            
            .frame(width: proxy.size.width)
        }
    }
    
  
    var verticalLayout: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    if weatherData.current != nil {
                        CurrentConditionsView(weatherData: weatherData, proxy: proxy)
                    }
                    
//                    if let hourlyData = appController.hourlyData {
//                        TabView {
//                            HourlyTemperatureView(hourlyData: hourlyData)
//                            HourlyRainView(hourlyData: hourlyData)
//                        }
//                        .tabViewStyle(PageTabViewStyle())
//                        .frame(width: proxy.size.width * 0.85, height: 200)
//                    }
                                    
                    eightDayForecast
                        .padding([.leading, .trailing], 10)
                }
            }
        }
    }
}

// MARK: - PREVIEWS

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(weatherData: WeatherData())
    }
}
