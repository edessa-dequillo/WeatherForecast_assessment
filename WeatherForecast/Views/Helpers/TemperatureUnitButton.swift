//
//  TemperatureUnitButton.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct TemperatureUnitButton: View {
    @EnvironmentObject var appController: AppController
    
    @State private var imperial = true
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.imperial.toggle()
                self.appController.changeUnits(isImperial: self.imperial)
            }
        }) {
            HStack {
                Image(systemName: "thermometer")
                Text( self.imperial ? "°F" : "°C" )
            }
            .padding(4)
        }
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.white, lineWidth: 1)
        )
    }
}

struct TemperatureUnitButton_Previews: PreviewProvider {
    static var previews: some View {
       TemperatureUnitButton()
            .environmentObject(AppController())
    }
}

