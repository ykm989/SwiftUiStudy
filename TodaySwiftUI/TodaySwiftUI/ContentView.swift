//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI

struct Person: Identifiable{
    var id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    var body: some View {
        MyView()
    }
}

struct MyView: View{
    var body: some View{
        Text("Hi Huko!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
