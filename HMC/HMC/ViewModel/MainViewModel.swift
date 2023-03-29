//
//  File.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import Foundation

class MainViewModel: ObservableObject{
    func now() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        
        return formatter.string(from: Date())
    }
    
    func dayCalculate(_ day: Int) -> [String]{
        
        let date = Calendar.current.date(byAdding: .day, value: day, to: Date())
        
        let formmater = DateFormatter()
        formmater.dateFormat = "YYYY년 M월 d일,E"
        
        print(formmater.string(from: date!).components(separatedBy: ","))
        
        return formmater.string(from: date!).components(separatedBy: ",")
    }
    
    func recordPosition(){
        DBHelper().insertData(Info(date: now(), position: ""))
    }
    
    func recordCount() -> Int{
        return DBHelper.dbData.count
    }
    
    func recordRefresh(){
        DBHelper().readData()
    }
}
