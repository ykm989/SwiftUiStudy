//
//  ToggleStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct ToggleStudy: View {
    @State private var colorBool: Bool = false
    
    var body: some View {
        VStack{
            Button {
                colorBool.toggle() // toggle을 Bool에 사용하면 true false 전환
            } label: {
//                colorBool ? Text("On") : Text("Off") // 삼항 연산자를 사용하면 손쉽게 변경
                Text("Toggle!")
            }
            
//            Toggle("Toggle~", isOn: $colorBool).tint(Color.red) // tint를 이용해서 버튼 커스텀도 가능
            
            
            colorBool ? Text("On") : Text("Off")
        }
        
        
    }
}

struct ToggleStudy_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStudy()
    }
}
