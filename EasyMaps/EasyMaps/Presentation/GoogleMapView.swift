//
//  GoogleMapView.swift
//  EasyMaps
//
//  Created by Jorge Mayta on 26/11/25.
//

import SwiftUI
import GoogleMaps

struct GoolgeMapView: UIViewRepresentable {
    let latitude: Double
    let longtitude: Double
    let title: String
    let description: String
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: latitude, longitude: longtitude, zoom: 15)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longtitude))
        marker.title = title
        marker.snippet = description
        
        let mapView = GMSMapView(options: options)
        
        marker.map = mapView
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
