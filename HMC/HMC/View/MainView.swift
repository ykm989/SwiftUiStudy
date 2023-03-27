//
//  MainView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import SwiftUI

struct MainView: View {
    @State private var animationAmount: CGFloat = 1
    @State var selectedTab = "house"
    var body: some View {
        ZStack(alignment: .bottom,content: {
            Color("MainColor").ignoresSafeArea(.all)
            VStack{
                Spacer()
                Button {
                    
                } label: {
                    Text("Find!").foregroundColor(.white)
                }
                .padding(50)
                .background(.green)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
//                        .animation(Animation.easeInOut(duration: 1)
//                            .repeatForever(autoreverses: false))
                }
                .onAppear{
                    self.animationAmount = 2
                }
                Spacer()
            }
            CustomTabBar(selectedTab: $selectedTab)
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
