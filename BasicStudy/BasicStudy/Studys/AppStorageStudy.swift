//
//  AppStorageStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/23.
//

import SwiftUI

struct AppStorageStudy: View {
    // 값 저장
    @AppStorage("test") var test: Bool = false
    
    var body: some View {
        VStack{
            if test{
                Text("True")
            } else {
                Text("False")
            }
            
            Button {
                test.toggle()
            } label: {
                Text("Test")
            }
            AppStudy()
            
        }
    }
}

struct AppStudy: View {
    // 값 출력
    var test = UserDefaults.standard.bool(forKey: "test")
    
    var body: some View{
        if test{
            Text("Second View True")
        } else {
            Text("Second View False")
        }
    }
    
}

struct AppStorageStudy_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageStudy()
    }
}
