//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI


struct ContentView: View {
    
    
    var body: some View{
        VStack{
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100)
                .padding([.bottom, .top], 100)
                .background(.green)
                .foregroundColor(.red)
                
            
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100)
                .padding(.leading, 100)
                .background(.green)
                .foregroundColor(.red)
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
