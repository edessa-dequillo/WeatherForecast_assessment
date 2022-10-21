//
//  WelcomeView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct WelcomeView: View {
    @EnvironmentObject var appController: AppController
    
    var body: some View {
        VStack {
            ZStack {
                Image("LaunchIcon")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("WeatherForecast")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            if let errorMessage = appController.errorMessage {
                Text(errorMessage)
                    .font(.title2)
                    .padding(.top)
                    .shadow(color: .cyan, radius: 10, x: 0, y: 0)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .background(Color.gray)
            .foregroundColor(.black)
    }
}
