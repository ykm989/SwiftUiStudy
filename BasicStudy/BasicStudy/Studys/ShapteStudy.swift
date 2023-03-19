//
//  ShapteStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

struct ShapteStudy: View {
    var body: some View {
        
        VStack{
            // 원
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 120)
            
            // 네모
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                
            // 모서리가 둥근 네모
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.yellow)
                .frame(width:200, height: 200)
            
            // 길쭉한 원?
            Capsule()
                .fill(Color.green)
                .frame(width:200, height: 120)
        }


    }
}

struct ShapteStudy_Previews: PreviewProvider {
    static var previews: some View {
        ShapteStudy()
    }
}
