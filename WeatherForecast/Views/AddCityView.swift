//
//  AddCityView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/15/22.
//

import SwiftUI

struct AddCityView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var store: StoreViewModel
    @StateObject private var weatherDataVM = WeatherDataViewModel()
    
    var body: some View {
        ZStack{
            Image("background2")
                 .resizable()
                 .scaledToFit()
                 .aspectRatio(contentMode: .fill)
                 
                
            VStack {
            VStack(spacing: 20) {
                TextField("Enter City", text: $weatherDataVM.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    // save weather in environment object
                   weatherDataVM.save {
                        weather in
                        store.addWeather(weather)
                        presentationMode.wrappedValue.dismiss()
                       
                    }
                   
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .navigationTitle("Add City")
                
                
            }
           // End of VStack1
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color(#colorLiteral(red: 0.913837254, green: 0.9333122373, blue: 0.9802277684, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                
            }
            .padding()
                
            
        //End of VStack2
        }
        //End of ZStack
        .edgesIgnoringSafeArea(.all)
      
        
        
        
       // .embedInNavigationView()
        
    }
}

struct AddCityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCityView().environmentObject(StoreViewModel())
    }
}
