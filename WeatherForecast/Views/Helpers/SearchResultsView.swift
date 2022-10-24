//
//  SearchResultsView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI
import MapKit


struct SearchResultsView: View {
    @ObservedObject var searchModel: LocationSearchModel
    @Binding var selectedItem: MKMapItem?
    
    var body: some View {
        VStack {
            Divider()
            
            if self.searchModel.searchTerms.count == 0 {
                if self.searchModel.isSearching {
                    Text("No items found")
                        .font(.title).padding()
                } else {
                    Text("Search for a city or place")
                        .font(.body).padding()
                }
            }
            
            List(searchModel.searchTerms, id: \.self) { term in
                VStack(alignment: .leading) {
                    Text(term)
                        .font(.headline)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.searchModel.mapItem(for: term) { mapItem in
                        self.selectedItem = mapItem
                    }
                }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchModel: LocationSearchModel(), selectedItem: .constant(nil))
    }
}
