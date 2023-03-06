//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image("default")
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 250, height: 200)
//            .clipped()
//            .background(.orange)
//            .border(.orange, width: 7)
        
        Image(systemName: "sun.min")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
