//
//  Onboard.swift
//  TextureUiClone
//
//  Created by 김경호 on 2023/03/15.
//

import SwiftUI

struct Onboard: View {
    let title: String
    let contents: String
    let image: Image
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Text(title)
                    Spacer()
                    Text(contents)
                }.frame(height:100)
                VStack{
                    Image(systemName: "bolt")
                    Button {
                        print("hello")
                    } label: {
                        Text("시작하기")
                    }.frame(width:200)
                        .background(.red)
                }
                
            }
        }
    }
}

struct Onboard_Previews: PreviewProvider {
    static var previews: some View {
        Onboard(
            title: "Read",
            contents: "책 속 문장으로 쉬운 독서를 시작합니다. 마음에 드는 문장은 스크랩으로 기록합니다.",
            image: Image(systemName: "bolt")
        )
        
    }
}
