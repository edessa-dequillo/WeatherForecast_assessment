//
//  DaysForecastView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/13/22.
//

import SwiftUI

struct DaysForecastView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView {
            
            navigationBar
            
            HStack {

                Image(systemName: "calendar")
                    .foregroundColor(Color.white)
                
                Text("5-DAY FORECAST")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            
            VStack (spacing: 16) {
                HStack {
                    Text("-")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("-°")
                        Text("-°")
                        
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("-")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("-°")
                        Text("-°")
                        
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("-")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("-°")
                        Text("-°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("-")
                    Spacer()
                    Image(systemName: "cloud.bolt.fill")
                    VStack {
                        Text("-°")
                        Text("-°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
                HStack {
                    Text("-")
                    Spacer()
                    Image(systemName: "cloud.bolt.rain.fill")
                    VStack {
                        Text("-°")
                        Text("-°")
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                
            }
            .padding(10)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 40, style: .continuous))
            
            
            Spacer()
            
    }
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.cyan.opacity(0.9), .gray.opacity(0.6), .cyan]), startPoint: .top, endPoint: .bottom)).zIndex(10)
}
    
    private var navigationBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left.circle")
                    Text("Back")
                }
        }
            .foregroundColor(Color.white)
            
            Spacer()
        
    }
        .padding()
    }
}
struct DaysForecastView_Previews: PreviewProvider {
    static var previews: some View {
       DaysForecastView()
    }
}
