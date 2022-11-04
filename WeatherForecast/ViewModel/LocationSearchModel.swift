//
//  LocationSearchModel.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI
import MapKit

class LocationSearchModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    
    @Published var searchTerms = [String]()
    @Published var isSearching = false
    
    private var completer: MKLocalSearchCompleter = MKLocalSearchCompleter()
    
   
    func searchFor(term: String, in region: MKCoordinateRegion? = nil) {
        completer.delegate = self
        completer.region = MKCoordinateRegion(.world)
        completer.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        completer.queryFragment = term
    }
    
    
    func mapItem(for term:String, onComplete: @escaping (MKMapItem) -> Void) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = term
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            if let response = response, let one = response.mapItems.first {
                DispatchQueue.main.async {
                    onComplete(one)
                }
            }
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
    
    func clearResults() {
        searchTerms.removeAll()
        isSearching = false
    }
    
    // MARK: - COMPLETER DELEGATE
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let results = completer.results.filter { result in
            guard result.title.contains(",") || !result.subtitle.isEmpty else { return false }
            guard !result.subtitle.contains("Nearby") else { return false }
            return true
        }
        self.searchTerms = results.map { $0.title + ($0.subtitle.isEmpty ? "" : ", " + $0.subtitle) }
        self.isSearching = true
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Completer failed with some error: \(error)")
        isSearching = false
    }
}

