//
//  StateStudyView.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct StateStudyView: View {
    // 값이 들어가지 않아도 View를 호출할 때 값을 주면 자동으로 반영이 됨
    @State var name: String
    @State var age: Int
    
    var body: some View {
        VStack{
            Text("\(name): \(age)")
            
            Button {
                age += 1
            } label: {
                Text("Age Up")
            }
            
            Button {
                age -= 1
            } label: {
                Text("Age Down")
            }

        }
    }
}

struct StateStudyView_Previews: PreviewProvider {
    static var previews: some View {
        StateStudyView(name: "Huko", age: 25)
    }
}


/*
 뷰 내부의 특정 View의 상태를 나타내는 변수
 뷰내부에서 밖에 사용이 불가능하다. - 그래서 private로 선언하는게 좋음
 하위 뷰나 다른 뷰에서 참조하기 위해서는 @Binding을 해야함
 state property에 해당하는 변수 값이 변경되면 view를 다시 렌더링한다. 때문에 항상 최신값을 가진다 Observer같은 느낌?
 뷰전체가 다시 랜더링 되는일을 막기 위해 하위뷰로 변동이 반영되는 뷰만 따로 빼준다.
 
 $를 이용해서 바인딩이 가능
 */
