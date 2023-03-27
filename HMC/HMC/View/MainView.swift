//
//  MainView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var animationAmount: CGFloat = 1
    @State var selectedTab = "house"
    @State var clickButton: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom,content: {
            Color("MainColor").ignoresSafeArea(.all)
            VStack{
                Spacer()
                Button {
                    clickButton.toggle()
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
                        .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false))
                }
                .onAppear{
                    self.animationAmount = 2
                }
                .alert("\(viewModel.now()) \n 기록되었습니다.", isPresented: $clickButton) {
                    Button("OK", role: .cancel) {}
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
