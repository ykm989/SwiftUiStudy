//
//  MapView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI
import MapKit

struct MapView: View {
    //서울 좌표
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true).edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
