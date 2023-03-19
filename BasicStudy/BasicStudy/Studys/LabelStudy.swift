//
//  LabelStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//
// Label과 Text의 차이는 Text는 텍스트만 Label은 Text + Icon

import SwiftUI

struct LabelStudy: View {
    var body: some View {
        
        
        VStack{
            // 사용법은 텍스트와 비슷하다. 하지만 아이콘이 꼭 들어가야하는 것 같다.
            Label("Hello", systemImage: "flag.fill")
                .foregroundColor(Color.blue)
                .background(Color.yellow)
            
            // 여러줄도 가능하다.
            Label("Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! ", systemImage: "flag.fill")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            // 폰트 사용법도 같음
            Label("Hello World!", systemImage: "heart.fill")
                .font(.largeTitle)
        }
        

    }
}

struct LabelStudy_Previews: PreviewProvider {
    static var previews: some View {
        LabelStudy()
    }
}
