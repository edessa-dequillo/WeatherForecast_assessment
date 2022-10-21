//
//  CancelSearchButton.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI

struct CancelSearchButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: "xmark.circle.fill")
                .font(.body)
                .foregroundColor(.black)
        })
    }
}

struct CancelSearchButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelSearchButton() { /* ignored */ }
    }
}
