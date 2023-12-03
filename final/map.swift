//
//  map.swift
//  final
//
//  Created by Supichakorn Boonkasem on 1/12/2566 BE.
//
import SwiftUI
import MapKit

struct MapAnnotationItem: Identifiable {
    let annotation: MKPointAnnotation
    
    var id: String { annotation.title ?? "" }
}

struct map: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    @State private var searchQuery = ""
    @State private var annotationItems = [MapAnnotationItem]()
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchQuery, onCommit: {
                performSearch(query: searchQuery)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Map(coordinateRegion: $region, annotationItems: annotationItems) { item in
                MapPin(coordinate: item.annotation.coordinate)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func performSearch(query: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                print("Search error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.annotationItems = response.mapItems.map { item in
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                
                return MapAnnotationItem(annotation: annotation)
            }
            
            if let firstItem = response.mapItems.first {
                self.region = MKCoordinateRegion(center: firstItem.placemark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        map()
    }
}
