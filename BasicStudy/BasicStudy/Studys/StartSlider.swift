//
//  StartSlider.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/04/01.
//

import SwiftUI

struct StartSlider: View {
    @State private var sliderValue: Double = 0.0
    
    var body: some View {
        VStack{
            Slider(value: $sliderValue, in: 0.0...10.0, step: 1).padding()
            
            VStack{
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<Int(sliderValue), id: \.self) { data in
                            if data % 2 == 1{
                                Image(systemName: "star.fill")
                            }
                            else if data % 2 == 0 && data == Int(sliderValue) - 1{
                                Image(systemName: "star.leadinghalf.filled")
                            }
                        }
                    }
                }.padding()
            }
        }
    }
    
    var nums: [Int] = []
    
}

struct StartSlider_Previews: PreviewProvider {
    static var previews: some View {
        StartSlider()
    }
}

/*
 
 truncatingRemainder
 */
