//
//  CollectionStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct CollectionStudy: View {
    
    // LazyVGrid는 GridItem이라는 매개변수를 생성해야함
    // .flexible을 사용하면 자동으로 화면을 꽉 채워줌
    // 한줄에 보여주는게 정해짐
    let columns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
//        ScrollView {
//             LazyVGrid(columns: columns) {
//                 ForEach(1..<50){ index in
//                     VStack{
//                         Rectangle()
//                             .frame(width: 100,height:50)
//                         Text("\(index)")
//                     }
//
//                 }
//             }
//         }
        
        // 가로로도 가능 spacing으로 간격 조절도 가능
//        ScrollView{
//            LazyHGrid(rows: columns, spacing: 0){
//                ForEach(1..<50){ index in
//                    HStack{
//                        Rectangle()
//                            .frame(width:100, height: 50)
//                        Text("\(index)")
//                    }
//                }
//            }
//        }
        
        ScrollView{
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: []
//                pinnedViews: [.sectionHeaders] // 여기를 설정하면 섹션이 화면에 고정하게 할 수 있다.
            ) {
                Section(header: Text("1번 섹션")){
                    ForEach(0..<10){_ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .shadow(radius: 10)
                            .frame(height: 100)
                            .padding(5)
                    }
                }
                Section(header: Text("2번 섹션")){
                    ForEach(0..<20){_ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .shadow(radius: 10)
                            .frame(height: 80)
                            .padding(5)
                    }
                }
                Section(header: Text("3번 섹션")){
                    ForEach(0..<20){_ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .shadow(radius: 10)
                            .frame(height: 80)
                            .padding(5)
                    }
                }
            }
        }
    }
}

struct CollectionStudy_Previews: PreviewProvider {
    static var previews: some View {
        CollectionStudy()
    }
}
