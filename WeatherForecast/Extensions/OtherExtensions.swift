//
//  OtherExtensions.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI
import MapKit

//MARK: - VIEW

#if canImport(UIKit)
extension View {
    
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//MARK: - COLOR

extension Color {
    
    public static let iconBackground = Color("DuskDawn")
    public static let dayLight = Color("DayLight")
    public static let nightLight = Color("NightLight")
    public static let searchBackground = Color("Cadet")
}

//MARK: - DATE

extension Date {
    

    
    func formattedHour() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        let result = String(formatter.string(from: self).dropLast())
        return result.lowercased()
    }
}

//MARK: - STRING LOCALIZATION

extension String {
    
   
    
    func localized() -> String {
        NSLocalizedString(self, comment: self)
    }
}
