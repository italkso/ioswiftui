//
//  MapView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var weather: Weather?
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: weather?.coord.lat ?? 37.785834, longitude: weather?.coord.lon ?? -122.406417)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(weather: Weather.all())
        .colorScheme(.dark)
    }
}
