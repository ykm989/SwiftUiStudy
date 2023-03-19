//
//  ShapteStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/19.
//

import SwiftUI

struct ShapteStudy: View {
    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 200, hegiht: 200)
    }
}

struct ShapteStudy_Previews: PreviewProvider {
    static var previews: some View {
        ShapteStudy()
    }
}
