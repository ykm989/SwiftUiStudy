//
//  SliderStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct SliderStudy: View {
    @State private var sliderValue = 0.0
    
    var body: some View {
        VStack{
            Slider(value: $sliderValue, in: 0...100, step: 1) // value : 바인딩할 변수, in : 범위, step: 이동 정도
                .accentColor(.orange) // 색상 지정
            Text("\(Int(sliderValue))")
            
            
        }
    }
}

struct SliderStudy_Previews: PreviewProvider {
    static var previews: some View {
        SliderStudy()
    }
}
