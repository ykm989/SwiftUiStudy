//
//  Model.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
// SQL Lite 사용
// NoSQL이 읽는 속도가 더 빠르기 때문에 사용. SQLite는 내장
//

import Foundation
import SQLite3
import SwiftUI

class Model{
    
    func firstStart() -> Bool{
        if UserDefaults.standard.bool(forKey: "FirstStart"){
            return true
        } else {
            @AppStorage("FirstStart") var firstBool: Bool = true
            
            return false
        }
    }
    
    
    func initDB(){
        
//        let fileManger = FileManager() // 파일 매니저 객체 생성
//        let docPathURL =
    }
    
}

class DBHelper {
    static let dbHelper = DBHelper()
    
    var db: OpaquePointer? // db를 가리키는 포인터
    // db 이름은 항상 "DB이름.sqlite" 형식으로 해줄 것.
    var path = "hmcdb.sqlite"
    
    init(){
        self.db = createDB()
    }
    
    // DB생성
    func createDB() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        do{
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
            
            // 파일경로에 있는 데이터 베이스와 연결
            // 없으면 생성, 있으면 넘어감
            if sqlite3_open(filePath.path, &db) == SQLITE_OK {
                print("Succesfully create Database path : \(filePath.path)")
                return db
            }
        }
        catch{
            print("error in createDB")
        }
        print("error in createDB - sqlite3_open")
        return nil
    }
    
    // 테이블 생성
    func createTable(){
        let query = "create table if not exists myDB (id INTEGER primary key autoincrement, overallData text)"
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Create Table Success")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("Create Table step fail : \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("error: create table sqlite3 prepare fail")
        }
        sqlite3_finalize(statement)
        
    }
}
