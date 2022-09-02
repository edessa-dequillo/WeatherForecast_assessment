//
//  BackgroundView2.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 8/18/22.
//

import SwiftUI

struct BackgroundView2: View {
    var body: some View {
        ZStack {
           Image("lighterbg")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundVIew2_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView2()
    }
}

