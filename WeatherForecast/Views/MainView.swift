//
//  MainView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/16/22.
//

import SwiftUI

struct MainView: View {
    @StateObject  var forecastListVM = ForecastListViewModel()
    @ObservedObject var weatherVM = WeatherDataViewModel()
    @EnvironmentObject var store: StoreViewModel
  
    var body: some View {
        ZStack {
            NavigationView {
                VStack{
                    
                    Picker(selection: $forecastListVM.system, label: Text("System")) {
                        Text("°C").tag(0)
                        Text("°F").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                    .padding(.vertical)
                    VStack(spacing: -100) {
                        NavigationLink(destination: WeatherListView().environmentObject(StoreViewModel()), label:  {
                            Text("Manage Cities")
                                
                        })
                        
                    }
                    HStack {
                        TextField("Search", text: $forecastListVM.location,
                                  onCommit: {
                                    forecastListVM.getWeatherForecast()
                                  })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay (
                                Button(action: {
                                    forecastListVM.location = ""
                                    forecastListVM.getWeatherForecast()
                                }) {
                                    Image(systemName: "xmark.circle")
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal),
                                alignment: .trailing
                            )
                        Button {
                            forecastListVM.getWeatherForecast()
                        } label: {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.title3)
                        }
                    }
                    List(forecastListVM.forecasts, id: \.day) { day in
                            VStack(alignment: .leading) {
                                Text(day.day)
                                    .fontWeight(.bold)
                                HStack(alignment: .center) {
                                  
                                    URLImage(url: API.Urls.weatherUrlAsStringByIcon(icon: day.icon))
                                        .frame(width: 50, height: 50)
                                        
                                           // Image(systemName: "hourglass")
                                        }
                                        .scaledToFit()
                                        .frame(width: 75)
                                    VStack(alignment: .leading) {
                                        Text(day.overview)
                                            .font(.title2)
                                        HStack {
                                            Text(day.high)
                                            Text(day.low)
                                        }
//
                                    }
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                }
                .padding(.horizontal)
               
                .alert(item: $forecastListVM.appError) { appAlert in
                    Alert(title: Text("Error"),
                          message: Text("""
                            \(appAlert.errorString)
                            Please try again later!
                            """
                            )
                    
                    )
                }
            }
            if forecastListVM.isLoading {
                ZStack {
                    Color(.white)
                        .opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    ProgressView("Searching")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                }
            }
        }
    }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
       MainView(forecastListVM:ForecastListViewModel())
    }
}
