//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI


struct ContentView: View {
    
    @State var name: String = ""
    
    // modify 공부하기
    
    var body: some View{
        Image(systemName: "bolt")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100)
            .background(.green)
            .foregroundColor(.red)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
