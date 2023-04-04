//
//  MapView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // 젠쿱 본체 위치
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.524685, longitude: 126.815368), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))

    // 데이터베이스 값 저장할 변수
    @State private var places: [Place] = [
//        Place(position: CLLocationCoordinate2D(latitude: 37.524685, longitude: 126.815368)),
        Place(position: CLLocationCoordinate2D(latitude: 37.520930, longitude: 126.809231))
    ]
    
    @State private var test : [Int] = []
    
    private var data = MainViewModel().recordRefresh()
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places){ item in
            MapMarker(coordinate: item.position)
        }
        .onAppear{
            data.forEach { data in
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
                
                let inputData = Place(position: position)
           
                
                if latitudeDouble != nil && longitudeDouble != nil {self.places.append(inputData)}
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
