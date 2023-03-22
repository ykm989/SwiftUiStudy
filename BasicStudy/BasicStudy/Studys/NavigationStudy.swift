//
//  NavigationStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct NavigationStudy: View {
    @State private var buttonBool: Bool = false
    @State private var name: String = "Hello:)"
    
    var body: some View {
//        NavigationView {
//            NavigationLink("Navigate"){
//                DetailView()
//            }
//        }
        
        // NavigationView대신 NavigationStack을 사용해야 한다.
        NavigationStack{
            // NavigationLink로 특정 뷰를 감싸주면 그 링크가 된다.
            NavigationLink("Navigate"){
                DetailView()
            }.tint(Color.red) // 색 설정도 가능
            
            if buttonBool{
                Text("Bool On!")
            }
            
            // Text를 버튼같이 만들 수 있다.
            Text("버튼인척 하는 텍스트").onTapGesture { // 터치가 됬을 때 아래와 같은 코드 동작
                    buttonBool.toggle()
            }
        }
    }
}

struct NavigationStudy_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStudy()
//            .preferredColorScheme(.dark) // 이걸로 다크 테마를 설정할 수 있다.
    }
}

struct DetailView: View{
    // ios13, 14 방식
    @Environment(\.presentationMode) var presentationMode
    
    // ios15 이상
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View{
        List{
            ForEach(0..<10, id: \.self){
                Text("Select : \($0)")
            }
        }
//        .navigationBarTitle("Bar Title")
        .navigationTitle("Title")
//        .navigationBarTitleDisplayMode(.inline) // 이걸 이용해서 화면 위에 넣을 수 있다.
        .toolbar {
            // ios13, 14 방식
            ToolbarItem{
                Button("ios13,14"){
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
            // ios 15 방식
            ToolbarItem{
                Button("ios15"){
                    dismiss()
                }
            }
            
        }
    }
}

/*
 NavigationView는 이후 업데이트 되지 않음
 NavigationView의 이어지는 건 똑같은 NavigationView여야한다? 그래서 앱이 시작 될 떄 NavigationView로 감싸주는 것도 방법 그렇게 되면 Preview에서 출력이 안되면 Preview도 NavigationView를 감싸준다.
 */
