//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Button {
//            print("Hitted2")
//        } label: {
//            Text("Huko")
//                .padding()
//                .frame(width: 150)
//                .background(.purple)
//                .cornerRadius(13)
//        }
        Button("Delete", role: .none) {
            print("deleted")
        }


        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
