//
//  SQLiteStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/27.
//

import SwiftUI
import SQLite3

struct SQLiteStudy: View {
    var body: some View {
        VStack(spacing: 10){
            //            Button {
            //                DBHelper().createDB()
            //            } label: {
            //                Text("Create DB")
            //            }
            
            Button {
                DBHelper().createTable()
            } label: {
                Text("Create Table")
            }
            
            Button {
                DBHelper().deleteTable()
            } label: {
                Text("Delete Table")
            }
            
            
            Button {
                DBHelper().insertData(studentInfo: Info(Date: "haha", position: "haha"))
            } label: {
                Text("Insert Data")
            }
            
            Button {
                DBHelper().deleteData()
            } label: {
                Text("Delete Data")
            }
            
            Button {
                DBHelper().readData()
            } label: {
                Text("Read Data")
            }
            
            
        }
    }
}

struct SQLiteStudy_Previews: PreviewProvider {
    static var previews: some View {
        SQLiteStudy()
    }
}

class DBHelper {
    static let dbHelper = DBHelper()
    
    var db: OpaquePointer? // db를 가리키는 포인터
    // db 이름은 항상 "DB이름.sqlite" 형식으로 해줄 것.
    var path = "mySqlite.sqlite"
    
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
        //AUTOINCREMENT를 사용하기 위해서는 INT 가 아니라 INTEGER을 사용해야 한다.
        let query = "create table if not exists myDB(id INTEGER primary key autoincrement, info text not null);"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Create Table SuccessFully \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n Create Table step fail :  \(errorMessage)")
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n create Table sqlite3_prepare Fail ! :\(errorMessage)")
            
        }
        
        sqlite3_finalize(statement)
    }
    
    func deleteTable(){
        let query = "DROP TABLE myDB"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Delete Table SuccessFully \(String(describing: db))")
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n Delete Table step fail ! : \(errorMessage)")
                
            }
        }
        else{
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n delete Table prepare fail! : \(errorMessage)")
            
        }
        
        sqlite3_finalize(statement)
    }
    
    func insertData(studentInfo: Info ){
        
        //autocrement일 경우에는 입력 부분에서는 컬럼을 추가 안해줘도 자동으로 추가가 되지만
        //쿼리 문에서는 이렇게 추가 해줘야합니다.
        let query = "insert into myDB (id, info) values (?,?);"
        
        var statement : OpaquePointer? = nil
        
        do {
            //이렇게 데이터를 인코등 해주고 그 데이터를 String으로 변형 해준다.
            //왜냐하면 bind 해줄 때 data 타입이 없기 때문이다.
            let data = try JSONEncoder().encode(studentInfo)
            let dataToString = String(data: data, encoding: .utf8)
            
            print(dataToString!)
            
            if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
                //insert는 read와 다르게 컬럼의 순서의 시작을 1 부터 한다.
                //따라서 id가 없기 때문에 2로 시작한다.
                sqlite3_bind_text(statement, 2, NSString(string: dataToString!).utf8String , -1, nil)
                
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("Insert data SuccessFully : \(String(describing: db))")
                }
                else{
                    let errorMessage = String(cString: sqlite3_errmsg(db))
                    print("\n insert Data sqlite3 step fail! : \(errorMessage)")
                }
            }
            else{
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n insert Data prepare fail! : \(errorMessage)")
            }
            
            
            sqlite3_finalize(statement)
            
        }
        catch{
            print("JSONEncoder Error : \(error.localizedDescription)")
        }
    }
    
    func readData() {
        
        let query = "select * from myDB;"
        
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                let id = sqlite3_column_int(statement, 0)
                
                
                //만약에 컬럼이 name 하나 뿐이 였다면 반환되는 결과물도 name 하나 뿐이기 때문에
                //이 부분이 1이 아니라 0이 되어야 한다.
                let studentInfo = String(cString: sqlite3_column_text(statement, 1))
                
                do{
                    //sql에 data 타입이 아니라 String 타입으로 저장이 되어 있기 때문에, 반드시 String 타입을 data 타입으로 변경해서 디코드 해줘야한다.
                    let data = try JSONDecoder().decode(Info.self, from: studentInfo.data(using: .utf8)!)
                    print("readData Result : \(id) \(data)")
                }
                catch{
                    print("JSONDecoder Error : \(error.localizedDescription)")
                }
                
                
            }
            
        }
        else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n read Data prepare fail! : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
        
    }
    
    
    
    
    func deleteData(){
        let query = "delete from myDB where id >= 2;"
        
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Delete data SuccessFully : \(String(describing: db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\n delete Data prepare fail : \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n delete Data prepare fail : \(errorMessage)")
        }
        
        sqlite3_finalize(statement)
    }
    
    func readData1(){
        let query = "select * from record;"
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, 01, &statement, nil) == SQLITE_OK{
            print(sqlite3_step(statement))
            // 현재 테이블에서 컬럼이 존재하면 계속 읽는다
            while sqlite3_step(statement) == SQLITE_ROW{
                // 정수형 컬럼을 가져올 때 사용한다. 뒤에 0은 첫번째 컬럼을 뜻한다.
                let id = sqlite3_column_int(statement, 0)
                
                // 문자열이라면 이렇게 text형식으로 가져온다. JSON으로 인코딩해서 String 형태로 넣어줬기 때문에 이렇게 받아와야 함
                let info = String(cString: sqlite3_column_text(statement, 1))
                
                do{
                    let data = try JSONDecoder().decode(Info.self, from: info.data(using: .utf8)!)
                    print("readData Result: \(id) \(data)")
                } catch{
                    print("JSONDecoder Error : \(error.localizedDescription)")
                }
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\n read Data prepare fail : \(errorMessage)")
        }
        sqlite3_finalize(statement)
    }
}

func now() -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY년 M월 d일"
    
    return formatter.string(from: Date())
}

struct Info : Codable{

    let Date : String
    let position: String
    
}
