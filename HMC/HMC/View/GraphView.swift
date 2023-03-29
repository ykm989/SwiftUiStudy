//
//  GraphView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI

struct GraphView: View{
    @State var data: [CGFloat] = [50,100,150,30,40,100,20]
    
    var body: some View{
        HStack(spacing: 20){
            BarView(value: data[6], week: MainViewModel().dayCalculate(6)[1])
            BarView(value: data[5], week: MainViewModel().dayCalculate(5)[1])
            BarView(value: data[4], week: MainViewModel().dayCalculate(4)[1])
            BarView(value: data[3], week: MainViewModel().dayCalculate(3)[1])
            BarView(value: data[2], week: MainViewModel().dayCalculate(2)[1])
            BarView(value: data[1], week: MainViewModel().dayCalculate(1)[1])
            BarView(value: data[0], week: MainViewModel().dayCalculate(0)[1])
        }.animation(.default)
    }
}

struct BarView: View {
    var value: CGFloat
    var week: String
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color.gray)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color.white)
            }
            Text(week).padding(.top, 8)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
