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
}