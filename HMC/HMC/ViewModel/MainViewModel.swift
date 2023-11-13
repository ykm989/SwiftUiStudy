//
//  File.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import Foundation
import CoreLocation


class MainViewModel: ObservableObject{
    let locationService = LocationService()
//    var places: [Place] = [Place(position: CLLocationCoordinate2D(latitude: 37.520930, longitude: 126.809231))]
    
    
    func now() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        
        return formatter.string(from: Date())
    }
    
    func dayCalculate(_ day: Int) -> [String]{
        
        let date = Calendar.current.date(byAdding: .day, value: day, to: Date())
        
        let formmater = DateFormatter()
        formmater.dateFormat = "YYYY년 M월 d일,E"
        
//        print(formmater.string(from: date!).components(separatedBy: ","))
        
        return formmater.string(from: date!).components(separatedBy: ",")
    }
    
    func recordPosition(){
        locationService.getLocation()
    }
    
    func recordCount() -> Int{
        return DBHelper.dbData.count
    }
    
    func recordRefresh() -> [Info]{
        DBHelper().readData()
        

        
        return DBHelper.dbData
    }
}

class LocationService: NSObject, CLLocationManagerDelegate{
    // 위치 관리자 객체 생성
    let manager = CLLocationManager()
    
    
    override init() {
        super.init()
        
        manager.delegate = self
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        DBHelper().insertData(Info(date: MainViewModel().now(), position: "\(latitude),\(longitude)"))
        
        manager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailRangingFor beaconConstraint: CLBeaconIdentityConstraint, error: Error) {
        print("Position Error : \(error)")
    }
    
    func getLocation(){
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    
    // https://bluesid.tistory.com/217

    
}


