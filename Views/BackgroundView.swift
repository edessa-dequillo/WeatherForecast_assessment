//
//  BackgroundView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/18/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
           Image("background2")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundVIew_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

