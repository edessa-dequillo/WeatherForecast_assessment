//
//  ContentViewHeader.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct ContentViewHeader: View {
   @Environment(\.horizontalSizeClass) var horizontalSizeClass
  //  @Environment(\.presentationMode) private var presentationMode
@State var showWeatherListView = false
    @EnvironmentObject var store: StoreViewModel
    var title: String
    var searchAction: () -> Void
    var body: some View {
       // NavigationView {
      
              
//            }
//        }
        
       VStack {
//           if showWeatherListView {
//                               WeatherListView().environmentObject(StoreViewModel())
//
//           }
           Button(action: { store.showWeatherList = true } ) {
                               Text ("Manage Cities")
                                   .foregroundColor(.nightLight)
                           }
        
            HStack {
    //            NavigationLink(destination: WeatherListView().environmentObject(StoreViewModel()), label:  {
    //                              Text("Manage Cities")
    //                                   .font(.caption)                                .padding(.leading, 12)
    //                                   .foregroundColor(.black)
    //            })
               
                
                TemperatureUnitButton()
                Spacer()
                Text(title).font(.headline)
                Spacer()
                SearchButton() {
                    self.searchAction()
                    
                }
            }
                
           }
            
            .background(Color.clear)
        
      
    }
}

struct ContentViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewHeader(title: "Test Place") {
            print("Button tapped")
        }
    }
}
