//
//  ContentView.swift
//  TextureUiClone
//
//  Created by 김경호 on 2023/03/14.
//

import SwiftUI

struct LanchScreenView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            HStack(spacing:0){
                Text("text")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text("ure")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(".")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    
            }
            
        }
    }
}


struct LancheScreen_Previews: PreviewProvider {
    static var previews: some View {
        LanchScreenView()
    }
}
