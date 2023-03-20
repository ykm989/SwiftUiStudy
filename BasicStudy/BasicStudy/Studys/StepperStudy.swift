//
//  StepperStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct StepperStudy: View {
    @State private var value = 0
    let step = 1
    let range = 0...100
    let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]
    
    var body: some View {
        VStack{
            Stepper(value: $value,
                    in: range, // 증감 범위
                    step: step) { // 증감률
                Text("Current: \(value) in \(range.description) " +
                     "stepping by \(step)")
            }
                    .padding(10)
            
            Stepper(onIncrement: incrementStep, // 함수를 걸 수 있다.
                    onDecrement: decrementStep)
            {
                Text("값: \(value) 색상: \(colors[value].description)")
            }
            .padding(5)
            .background(colors[value])
        }

    }
    
    func incrementStep(){
        value += 1
        
        if value >= colors.count{value = 0}
    }
    
    func decrementStep(){
        value -= 1
        
        if value < 0 {value = colors.count - 1}
    }
}
//extension StepperStudy{
//    func incrementStep(){
//        value += 1
//
//        if value >= colors.count{value = 0}
//    }
//
//    func decrementStep(){
//        value -= 1
//
//        if value < 0 {value= colors.count - 1}
//    }
//}

struct StepperStudy_Previews: PreviewProvider {
    static var previews: some View {
        StepperStudy()
    }
}
