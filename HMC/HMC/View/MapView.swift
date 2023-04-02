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
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.520930, longitude: 126.809231), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    @State private var places: [Place] = [Place(position: CLLocationCoordinate2D(latitude: 37.520930, longitude: 126.809231))]
    
    private var data = MainViewModel().recordRefresh()
    
    init(){
        print("init 시작")
        print(data)
        
        data.forEach { data in
            print(data)
            let stringPosition = data.position.components(separatedBy: ",")
            
            guard let latitudeDouble = Double(stringPosition[0]) else {
                print("Position to String : \(stringPosition)")
                return
            }
            
            guard let longitudeDouble = Double(stringPosition[1]) else {
                print("Position to String : \(stringPosition)")
                return
            }
            
            let position = CLLocationCoordinate2D(latitude: Double(stringPosition[0])!, longitude: Double(stringPosition[1])!)
            
            places.append(Place(position: position))
        }
        print("init 결과")
        print(places)
    }
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places){ item in
            MapMarker(coordinate: item.position)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
