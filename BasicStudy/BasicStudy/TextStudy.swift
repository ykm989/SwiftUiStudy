//
//  TextStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

struct TextStudy: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            //색상 변경
            Text("Hello, World!")
                .foregroundColor(Color.blue)
                .background(Color.red)
            
            // 라인 제한
            Text("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
                .lineLimit(3)
            
            // 일부 생략
            Text("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
                .lineLimit(3)
                .foregroundColor(.yellow)
                .truncationMode(.middle)
            
            // 줄 간격
            Text("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
                .lineLimit(3)
                .foregroundColor(.green)
                .lineSpacing(30)
            
            // 여러줄 정렬
            Text("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
                .lineLimit(3)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.leading)
            
            // 폰트
            Text("Hello World!")
                .font(.largeTitle)
            
            // Custom Font
            Text("Hello World!")
        }
        
    }
}

struct TextStudy_Previews: PreviewProvider {
    static var previews: some View {
        TextStudy()
    }
}
