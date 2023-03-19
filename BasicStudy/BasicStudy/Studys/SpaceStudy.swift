//
//  SpaceStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

struct SpaceStudy: View {
    var body: some View {
        VStack{
            VStack{
                // 공간을 만들어줌
                Spacer()
                Text("Hello World1")
                    .background(Color.blue)
                // 최솟값만 지정 가능
                Spacer(minLength: 50)
                Text("Hello World2")
                    .background(Color.green)
                Spacer()
            }
            HStack{
                Spacer()
                Text("Hello World3")
                Spacer()
                Text("Hello World4")
                Spacer()
            }
            
            VStack{
                // 공간을 만들어줌
                Text("Hello World5")
                    .background(Color.blue)
                // 최솟값만 지정 가능
                
                Text("Hello World6")
                    .background(Color.green)
                
            }
        }
        
        
    }
}

struct SpaceStudy_Previews: PreviewProvider {
    static var previews: some View {
        SpaceStudy()
    }
}


/*
 Spacer()는 사용 가능한 전체 공간을 뛰움
 여러개가 있다면 그것을 등분해서 뛰움
 Spacer보다는 padding을 쓰면 더 편하다.
 */
