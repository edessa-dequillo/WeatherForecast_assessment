//
//  LocationSearchView.swift
//  WeatherForecast
//
//  Created by edessa.dequillo on 10/21/22.
//

import SwiftUI
import MapKit


struct LocationSearchView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appController: AppController
    
    @StateObject private var searchModel = LocationSearchModel()
    
    @State private var searchTerm = ""
    @State private var selectedItem: MKMapItem?
    @State private var showingHistory = true
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SearchHistoryItem.title, ascending: true)],
        animation: .default)
    private var historyItems: FetchedResults<SearchHistoryItem>
    
    struct CurrentLocationButton: View {
        var action: () -> Void
        var body: some View {
            Button(action: self.action) {
                Group {
                    Image(systemName: "location.fill")
                    Text("Use current location")
                }
            }
            .font(.caption)
        }
    }
  
    var body: some View {
        
      
        VStack{
            
          
            HStack {
                Image(systemName: "magnifyingglass")
              
                TextField("Search", text: self.$searchTerm, onCommit: {
                    self.hideKeyboard()
                })
                .onChange(of: self.searchTerm) { (value) in
                    self.searchModel.searchFor(term: value)
                    self.showingHistory = false
                }
            }
            .padding()
            
            
            VStack {
                HStack {
                    
    //                Text("")
    //                    .font(.caption)
    //                    .padding(.leading, 12)
    //                Spacer()
                    CurrentLocationButton() {
                        self.appController.updateCurrentLocation()
                        self.searchTerm = ""
                        self.searchModel.clearResults()
                        self.hideKeyboard()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 130)
                }
                
            
            

            
        
            // Search History or Search Results
            
            if self.showingHistory && historyItems.count > 0 {
                SearchHistoryView(historyItems: self.historyItems, onDelete: self.deleteItems) { (item) in
                    self.searchTerm = item.title!
                    self.appController.updateCurrentLocation(with: CLLocation(latitude: item.latitude, longitude: item.longitude), title: item.title!)
                    self.presentationMode.wrappedValue.dismiss()
                }
            } else {
            
               
                SearchResultsView(searchModel: self.searchModel, selectedItem: self.$selectedItem)
                    .onChange(of: self.selectedItem) { (newItem) in
                        self.hideKeyboard()
                        if let newItem = newItem {
                            self.searchTerm = newItem.placemark.name!
                            self.appController.updateCurrentLocation(with: newItem)
                            self.addItemToHistory(item: newItem)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
            }
            
           
                    }
        }
        .background(Color.searchBackground)
        
    
    }
    
    // SEARCH HISTORY ADD AND DELETE
    
    func addItemToHistory(item: MKMapItem) {
        let newItem = SearchHistoryItem(context: viewContext)
        newItem.title = item.placemark.title
        newItem.latitude = item.placemark.coordinate.latitude
        newItem.longitude = item.placemark.coordinate.longitude
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Cannot save history: \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteItems(offsets: IndexSet) {
       // withAnimation {
            offsets.map { historyItems[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
