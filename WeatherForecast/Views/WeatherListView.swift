//
//  WeatherListView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import SwiftUI
//import CoreData

enum Sheets: Identifiable {
    var id: UUID{
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListView: View {

  
    @EnvironmentObject var store: StoreViewModel
    
    @State private var activeSheet: Sheets?
   
        
    var body: some View {
        ZStack{
            //BackgroundView2()
        List {
            ForEach(store.weatherList, id: \.id) { weather in WeatherCell(weather: weather)
            
            }
            .swipeActions(edge: .leading) {
                Button("Delete", role: .destructive) {
                            withAnimation {
                                store.weatherList.removeAll()
                                }
                            }
                        }
                    }
     
        //End of List
        .listStyle(PlainListStyle())
        
        .sheet(item: $activeSheet, content: {
            (item) in switch item {
            case .addNewCity: AddCityView().environmentObject(store)
            case .settings: SettingsView()
            }
        })
        
       
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
           
        }) {
            Image(systemName: "gearshape")
        },trailing: Button(action: {
            activeSheet = .addNewCity
            
        }, label: {
            Image(systemName: "plus")
        }))
        }.background(Color.gray)
        .padding()
        .navigationTitle("Manage Cities")
        .embedInNavigationView()
        .edgesIgnoringSafeArea(.all)
    }
       
}



struct WeatherCell: View {
    
    @EnvironmentObject var store: StoreViewModel
    
    let weather: WeatherViewModel
    
    
    var body: some View {
            
            HStack {
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(weather.city)
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName: "sunrise")
                        Text("\(weather.sunrise.formatAsString())")
                    }
                    HStack {
                        Image(systemName: "sunset")
                        Text("\(weather.sunset.formatAsString())")
                    }
                }
                Spacer()
                URLImage(url: API.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                    .frame(width: 50, height: 50)
                
                
                Text("\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit)))°\(String(store.selectedUnit.displayText.prefix(1)))")
            }
            
            .padding()
          
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        
    }
}
struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView().environmentObject(StoreViewModel())
      
    }
}
