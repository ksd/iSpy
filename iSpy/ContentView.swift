//
//  ContentView.swift
//  iSpy
//
//  Created by ksd on 13/10/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var manager: LocationManager
    
    private var region: Binding<MKCoordinateRegion> {
        Binding {
            manager.region
        } set: { value in
            manager.region = value
        }
    }
    
    var body: some View {
        
        Map(coordinateRegion: region, showsUserLocation: true)
        
}
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocationManager())
    }
}
