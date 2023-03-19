//
//  ScrollViewStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct ScrollViewStudy: View {
    var body: some View {
        VStack{
//            // 기본 스크롤
//            ScrollView{
//                ForEach(1..<30){
//                    Text("Item \($0)")
//                        .font(.title)
//                }
//            }
//
//            // 수평 스크롤
//            ScrollView(.horizontal){
//                HStack{
//                    ForEach(1..<30){
//                        Text("Item \($0)")
//                            .font(.title)
//                    }
//                }
//            }
//
//            // 스크롤바 숨기기
//            ScrollView(.horizontal, showsIndicators: false){
//                HStack{
//                    ForEach(1..<30){
//                        Text("Item \($0)")
//                            .font(.title)
//                    }
//                }
//            }
            
            // 스크롤 안에 스크롤 넣기도 가능
            ScrollView{
                ForEach(1..<20){_ in
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(1..<5){_ in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewStudy_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewStudy()
    }
}
