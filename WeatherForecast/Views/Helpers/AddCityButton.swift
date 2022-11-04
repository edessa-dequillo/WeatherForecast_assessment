//
//  AddCityButton.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 11/4/22.
//

import SwiftUI


struct AddCityButton: View {
    var action  = WeatherListView()
    
    var body: some View {
        Button(action: { self.WeatherListView }, label: {
            Image(systemName: "plus")
        })
        .font(.title)
    }
}

struct AddCityButton_Previews: PreviewProvider {
    static var previews: some View {
      AddCityButton() {
            print("SearchButton tapped")
        }
    }
}

