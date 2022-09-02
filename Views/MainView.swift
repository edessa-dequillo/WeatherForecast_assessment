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
    @State var showWeatherListView: Bool = false
    
    var body: some View {
        
        ZStack {
            
            VStack  {
                if showWeatherListView {
                    WeatherListView().environmentObject(StoreViewModel())
                            } else {
                                Button("Manage  Cities") {
                                    self.showWeatherListView = true
                                }
                            }
            
                        VStack {
                            
                            TextField("Search", text: $searchTerm)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.trailing, 30)
                                .padding(.leading,25)
                            Button {
                               weatherVM.city = searchTerm
                            }
                        label: {Image(systemName: "magnifyingglass")
                                    .position(x: 300, y: -25)
                                
                        }
                        }
                        }
            
           
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

