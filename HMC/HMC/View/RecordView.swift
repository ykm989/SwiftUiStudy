//
//  RecordView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI

struct RecordView: View {
    @State private var data = MainViewModel().recordRefresh()
    
    init(){
        data = MainViewModel().recordRefresh()
    }
    
    var body: some View {
        VStack{
            GraphView().padding(.top, 24).animation(.default)
            
            List {
                ForEach(data, id: \.self) { data in
                    HStack{
                        Image(systemName: "car.side")
                        Text(data.date)
                    }
                }
            }
            .background(.black)
            .scrollContentBackground(.hidden)
//            .padding(100)
        }
        
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
