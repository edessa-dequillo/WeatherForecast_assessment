//
//  SettingsView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
   
}

struct SettingsView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var store: StoreViewModel
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .celsius
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    
    var body: some View {
        
            VStack{
                Form {
                    
                    Section(header:Text("Display").padding(.bottom), footer: Text("TEMPERATURE UNIT").padding(.top).font(.custom("Arial", size: 12))) {
                        Toggle(isOn: $isDarkMode, label: { Text("Dark mode")
                                
                    })
                       
                    }
                    Section {
                
                    Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                        ForEach(TemperatureUnit.allCases, id: \.self) {
                            Text("\($0.displayText)" as String)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                  
                }
                  
                .navigationBarTitle(Text("Settings"), displayMode: .large)

                .navigationBarItems(trailing: Button("Done"){
                    mode.wrappedValue.dismiss()
                    store.selectedUnit = selectedUnit
                    
            })
                
              
            }
                .preferredColorScheme(isDarkMode ? .dark : .light)
            
             
            }.embedInNavigationView()
  

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView ()
    }
}
}
