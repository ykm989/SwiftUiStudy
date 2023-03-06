//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello!")
                .bold()
                .italic()
                .strikethrough()
            Text("Huko!")
                .font(.system(size: 60))
            Text("어렵")
                .underline(true, color: .orange)
                .foregroundColor(.red)
                .background(.purple)
            Text("Hello Swift UI")
                .foregroundColor(.green)
                
                
                .font(.system(size: 39, weight: .bold, design: .rounded))
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
