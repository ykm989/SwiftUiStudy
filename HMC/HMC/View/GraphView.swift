//
//  GraphView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI

struct GraphView: View{
    @State var data: [CGFloat] = [5,8,10,3,4,9,1]
    
    var body: some View{
        HStack(spacing: 20){
            BarView(value: data[6] * 20, week: MainViewModel().dayCalculate(-6)[1])
            BarView(value: data[5] * 20, week: MainViewModel().dayCalculate(-5)[1])
            BarView(value: data[4] * 20, week: MainViewModel().dayCalculate(-4)[1])
            BarView(value: data[3] * 20, week: MainViewModel().dayCalculate(-3)[1])
            BarView(value: data[2] * 20, week: MainViewModel().dayCalculate(-2)[1])
            BarView(value: data[1] * 20, week: MainViewModel().dayCalculate(-1)[1])
            BarView(value: data[0] * 20, week: "Today")
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
                    .foregroundColor(Color.red)
            }
            Text(week).padding(.top, 8).foregroundColor(Color.green)
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
