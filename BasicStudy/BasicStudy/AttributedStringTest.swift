//
//  ContentView.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/17.
//

import SwiftUI

struct AttributedStringTest: View {
    var message1: AttributedString{
        var result = AttributedString("Hello")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .red
        return result
    }
    var message2: AttributedString{
        var result = AttributedString("World")
        result.foregroundColor = .yellow
        return result
    }
    
    var body: some View {
        VStack {
            Text(message1 + message2)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AttributedStringTest()
    }
}
