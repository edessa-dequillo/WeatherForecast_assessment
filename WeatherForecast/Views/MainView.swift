//
//  MainView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/16/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var weatherVM = WeatherDataViewModel()
    @State private var searchTerm = ""
    @StateObject private var weatherDataVM = WeatherDataViewModel()
    @EnvironmentObject var store: StoreViewModel
  // @AppStorage ("isDarkMode") private var isDarkMode = false
  //  @State var showWeatherListView: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack  {
                NavigationLink(destination: WeatherListView().environmentObject(StoreViewModel()), label:  {
                    Text("Manage Cities")
                })
//                if showWeatherListView {
//                    WeatherListView().environmentObject(StoreViewModel())
//                            } else {
//                                Button("Manage  Cities") {
//                                    self.showWeatherListView = true
//                                }
//                            }
            
                        VStack {
                            
                            VStack(spacing: 20) {
                                TextField("Search", text: $weatherDataVM.city)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button() {
                                    // save weather in environment object
                                   weatherDataVM.save {
                                        weather in
                                        store.addWeather(weather)
                                       // presentationMode.wrappedValue.dismiss()
                                       
                                   }
                                    
                                }
                            
                        label: {Image(systemName: "magnifyingglass")
                                    .position(x: 360, y: -35)
                                
                        }
                            }.padding()
                        }
            }//.preferredColorScheme(isDarkMode ? .dark : .light)
           
            //End of Vstack1
        }//.embedInNavigationView()
        .background(Color.gray)
        
           
        //end of ZStack
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(weatherVM: WeatherDataViewModel())
    }
}

