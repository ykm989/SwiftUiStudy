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
            
            // 스크롤 안에 스크롤 넣기도 가능 Lazy를 사용하는걸 권장
            ScrollView{
                ForEach(1..<20){_ in
                    ScrollView(.horizontal){
//                        LazyHStack{
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

/*
 Contents가 많아지면 랙이 걸릴수도 있다.
 그래서 lazy를 써야한다
 VStack -> LazyVStack
 HStack -> LazyHStack
 ZStack -> LazyZStack
 
 LazyStack의 역활은 보이는 부분까지만 contents를 로딩해주고 나머지는 스크롤을 내릴떄 로딩해서 자원을 아껴준다.
 1...100일때 일반 스택은 100까지 View가 모두 불러오지만
 Lazy는 화면에서 보이는게 10개라면 10까지만 불러온다.
 */
