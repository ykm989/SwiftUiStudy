//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI


struct ContentView: View {
    
    @State var name: String = ""
    
    var body: some View{
        VStack{
            Text("Hi \(name)")
            
            Button {
                name = "Leeo!"
            } label: {
                Text("Click")
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
