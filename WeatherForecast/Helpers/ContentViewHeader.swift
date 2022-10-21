//
//  ContentViewHeader.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct ContentViewHeader: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    //@State private var showWeatherListView: Bool = false
    
    var title: String
    var searchAction: () -> Void
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: WeatherListView().environmentObject(StoreViewModel()), label:  {
                              Text("Manage Cities")
                                   .font(.caption)                                .padding(.leading, 12)
                                   .foregroundColor(.black)
                        })
        }
        HStack {
            TemperatureUnitButton()
            Spacer()
            Text(title).font(.headline)
            Spacer()
            SearchButton() {
                self.searchAction()
            }
        }
        .background(Color.clear)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .padding([.leading, .trailing], 20)
//        if showWeatherListView {
//            WeatherListView().environmentObject(StoreViewModel())
//                    } else {
//                        Button("Add City") {
//                            self.showWeatherListView = true
//                            self.hideKeyboard()
//                        }
           
    }
}

struct ContentViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewHeader(title: "Test Place") {
            print("Button tapped")
        }
    }
}
