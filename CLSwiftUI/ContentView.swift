//
//  ContentView.swift
//  CLSwiftUI
//
//  Created by Salvador Lopez on 31/07/23.
//

import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    
    @StateObject var locationManger = LocationManager()
    @State var userLocation: CLLocation?
    @State var region = MKCoordinateRegion()
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .frame(width: 350, height: 350)
            if let location = userLocation {
                Text("Latitud: \(location.coordinate.latitude)")
                Text("Longitud: \(location.coordinate.longitude)")
            }else{
                Text("Waiting for location...")
            }
        }
        .padding()
        .onAppear{
            locationManger.requestLocation()
        }
        .onReceive(locationManger.$currentLocation) { location in
            userLocation = location
            updateMapRegion()
        }
    }
    
    func updateMapRegion(){
        guard let location = userLocation else {
            return
        }
        region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
