//
//  AnimationStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct AnimationStudy: View {
    @State private var animationBool = false
    @State private var animationAmount: CGFloat = 1
    
    
    var body: some View {
        VStack{
            Spacer()
            Button {
                animationBool.toggle()
            } label: {
                Text("Tap Me").foregroundColor(Color.white)
            }
            .padding(50)
            .background(animationBool ? Color.blue : Color.red )
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.yellow, lineWidth: 2)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false))
            )
            .onAppear{
                self.animationAmount = 2
            }
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(animationBool ? Color.white : Color.blue)
                .frame(width: 200, height: 200)
//                .animation(.default)
                .animation(.easeIn(duration: 1)) // 시간초를 줄 수 있다.

            
            Spacer()
            
            if animationBool{
                Rectangle()
                    .fill(Color.green)
                //                .opacity(animationBool ? 0.0 : 1.0)
                    .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), // 나타날때 선택
                                            removal: AnyTransition.move(edge: .leading)) // 사라질때
                    )
                    .animation(.easeIn(duration: 1))
            }
                
            
            
        }
    }
}

struct AnimationStudy_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStudy()
    }
}

/*
 animation을 걸어두면 상태가 변할 때 그 변하가 애니메이션 효과를 가진다.
 */
