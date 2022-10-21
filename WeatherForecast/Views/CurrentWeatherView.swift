//
//  CurrentWeatherView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/13/22.
//

import SwiftUI

struct CurrentWeatherView: View {

    var currentWeatherVM = WeatherDataViewModel()

var body: some View {
    NavigationView {
        HStack {
            ZStack {
                LinearGradient(gradient: .init(colors: [.pink, .purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ZStack(alignment: .center) {
                    
                    VStack {
                        VStack {
                            NavigationLink(destination: MainView(forecastListVM: ForecastListViewModel()), label:  {
                                Text("Search Cities")
                            })
                        }
                        VStack (alignment: .center, spacing: 10) {
                            
                            Text(currentWeatherVM.city)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        VStack {
                            HStack {
                                VStack(spacing: 10) {
                                    Image(systemName: "cloud.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(Color.white)
                                    
//
                                }
                                .frame(width: 100, alignment: .leading)
                                
                               
                                
                            }
                            
                            Spacer()
                                .frame(height:  250)
                            
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 50) {
                            HStack {
                                Text("Today's Weather")
                                    .bold()
                                    .padding(.bottom)
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                
                                NavigationLink(destination: DaysForecastView(), label: {
                                    
                                    Text("Next 5 Days")
                                        .bold()
                                        .padding(.bottom)
                                        .foregroundColor(Color.white)
                                    
                                })
                                .navigationTitle("")
                                Image(systemName: "chevron.right.circle")
                                    .padding(.bottom)
                                    .foregroundColor(Color.white)
                                
                            }
                            
                        
                            HStack {
                                Image(systemName: "sunrise")
                               // Text((currentWeatherVM.sunrise.formatAsString()))
                                
                                Spacer()
                                
                                Image(systemName: "sunset")
                              //  Text("\(currentWeatherVM.sunset.formatAsString())")
                            }
                        } // End of VStack
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(20)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                  
                    } // end of first VStack
                }
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
    }
    
}

}

//struct CurrentWeatherView_Previews: PreviewProvider {
//static var previews: some View {
//    CurrentWeatherView(currentweather: WeatherResponse)
//}
//}
