//
//  UIApplication.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 9/22/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

