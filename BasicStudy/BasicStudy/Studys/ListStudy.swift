//
//  ListStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

// 값이 겹치면 에러가 나는 경우가 있어 고유값을 줘서 방지
struct Fruit: Identifiable{
    var id = UUID()
    var name: String
}


struct ListStudy: View {
    @State var listData: [Fruit] = [Fruit(name: "BlueBerry"), Fruit(name: "Apple"), Fruit(name: "Orange")]
    @State var list: [String] = ["BlackBerry", "potato", "Straberry"]
    
    var body: some View {
        VStack{
//            listStudyOne
            listStudyTwo
        }
        
    }
}
extension ListStudy{ // Body코드를 깔끔하게 하기 위해서 뷰를 아래에 정의도 가능
    var listStudyOne: some View{
        VStack{
            List {
                Text("Hello")
                Text("World")
            }
            
            List{
                // id값이 없다면 이렇게 넣어주기가 가능
                ForEach(list, id: \.self) { data in
                    Text(data)
                }
            }
            
            List{
                // 있다면 넣어주지 않아도 가능
                ForEach(listData) { data in
                    Text(data.name)
                }
            }
        }
    }
    var listStudyTwo: some View{
        NavigationView{
            VStack{
                List{
                    ForEach(listData) { data in
                        Text(data.name)
                    }
                }.background(Color.blue, in: Rectangle())
                .navigationBarTitle("Fruits") // title 설정 가능
                .toolbar{EditButton()} // EditButton을 넣어줄 수 있다.
                
                // 아이템 옮기기
                List{
                    ForEach(listData) { data in
                        Text(data.name)
                    }
                    .onMove(perform: move)
                }
                
                // 아이템 삭제
                List{
                    ForEach(listData) { data in
                        Text(data.name)
                    }
                    .onDelete(perform: deldete)
                }
                
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int){
        listData.move(fromOffsets: source, toOffset: destination)
    }
    
    func deldete(at offsets: IndexSet){
        listData.remove(atOffsets: offsets)
    }
}



struct ListStudy_Previews: PreviewProvider {
    static var previews: some View {
        ListStudy()
    }
}
