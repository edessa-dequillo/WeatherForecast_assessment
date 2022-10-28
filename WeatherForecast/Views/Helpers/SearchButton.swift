//
//  SearchButton.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct SearchButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: { self.action() }, label: {
            Image(systemName: "magnifyingglass")
        })
        .font(.title)
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton() {
            print("SearchButton tapped")
        }
    }
}
