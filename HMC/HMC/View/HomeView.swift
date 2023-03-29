//
//  HomeView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/29.
//

import SwiftUI

struct HomeView: View{
    @StateObject var viewModel = MainViewModel()
    @State var clickButton: Bool = false
    @State private var animationAmount: CGFloat = 1
    
    var body: some View{
        VStack{
            Spacer()
            Button {
                viewModel.recordPosition()
                clickButton.toggle()
            } label: {
                Text("Find!").foregroundColor(.white)
            }
            .padding(50)
            .background(Color("UIColor"))
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color("UIColor"), lineWidth: 2)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
