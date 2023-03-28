//
//  DBTest.swift
//  HMC
//
//  Created by 김경호 on 2023/03/28.
//

import SwiftUI

struct DBTest: View {
    var body: some View {
        VStack{
            Button{
                DBHelper().createDB()
            } label: {
                Text("Create DB")
            }
            
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
                DBHelper().insertData(Info(date: "5", position: "5"))
            } label: {
                Text("Insert Data")
            }

            Button {
                DBHelper().readData()
            } label: {
                Text("Read Data")
            }
        }
    }
}

struct DBTest_Previews: PreviewProvider {
    static var previews: some View {
        DBTest()
    }
}
