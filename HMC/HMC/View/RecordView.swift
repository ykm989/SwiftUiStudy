//
//  RecordView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI

struct RecordView: View {
    var test = ["hello", "hello"]
    @State private var testa = DBHelper.dbData
    
    var body: some View {
        VStack{
            Button {
                DBHelper().readData()
                testa = DBHelper.dbData
                print(testa)
            } label: {
                Text("Refresh")
                
            }

            List {
//                ForEach(test, id: \.self) { data in
//                    Text(data)
//                }
                
                ForEach(testa, id: \.self) { data in
                    HStack{
                        Image(systemName: "car.side")
                        Text(data.date)
                    }
                }
            }
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
