//
//  SearchHistoryView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI


struct SearchHistoryView: View {
    var historyItems: FetchedResults<SearchHistoryItem>
    var onDelete: (IndexSet) -> Void
    var onSelection: (SearchHistoryItem) -> Void
    
    var body: some View {
        List {
            Text("Recent Searches")
                .font(.headline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
            ForEach(historyItems) { item in
                Button(item.title!) {
                    self.onSelection(item)
                }
                .foregroundColor(.black)
            }
            .onDelete(perform: self.onDelete)
        }
    }
}
