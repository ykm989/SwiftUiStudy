//
//  FrameStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

struct FrameStudy: View {
    var body: some View {
        VStack{
            // 고정된 사이즈
            Text("Hello World!")
                .frame(width:100, height: 200)
                .background(Color.yellow)
            // 최소/최대 사용
            Text("Hello World2")
                .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 200, alignment: .leading)
                .background(Color.blue)
        }.background(Color.green) // VStack은 안의 컨텐츠에 따라 크기가 달라짐
                
    }
}

struct FrameStudy_Previews: PreviewProvider {
    static var previews: some View {
        FrameStudy()
    }
}

/*
 SwiftUI에서는 AutoLayout과 달리, 본인이 속한 부모뷰와 본인의 콘텐츠에 동시에 영향을 받아 자동으로 Layout을 결ㅈ어
 기본적으로 Safe Area을 준수 edgesIgnoringSafeArea로 무시 가능
 
 frame으로 조정하는 방법
 1. 고정된 사이즈
 2. 최소/최대/이상적 사이즈 정의
 
 frame은 디버깅에서 보면 여러층으로 겹쳐져 있는게 아니라 하나의 층에 그려져 있다.
 */
