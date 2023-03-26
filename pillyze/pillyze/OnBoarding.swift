//
//  OnBoarding.swift
//  Pillyze
//
//  Created by 김경호 on 2023/03/24.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        VStack{
            Spacer()
            TabView {
                OnBoardContent(onboardText: "내 몸에 맞게", onboardLabel: "영양제와 음식을 한 번에 관리", image: "Onboard1")
                OnBoardContent(onboardText: "내 건강 고민에 딱 맞는", onboardLabel: "영양제 & 식단을 추천해줘요", image: "Onboard2")
                OnBoardContent(onboardText: "과도한지 부족한지", onboardLabel: "내 영양제 함량 분석하세요", image: "Onboard3")
                OnBoardContent(onboardText: "점수로 간편하게", onboardLabel: "매일 식단 관리하세요", image: "Onboard4")
                OnBoardContent(onboardText: "직접 먹어본 사람들이 쓴", onboardLabel: "영양제 후기 확인하세요", image: "Onboard5")
                OnBoardContent(onboardText: "내 체질량, 혈압 등 10년치", onboardLabel: "검진 결과 한 눈에 확인해요", image: "Onboard6")
            }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .padding(EdgeInsets(top: 100, leading: 10, bottom: 20, trailing: 10))
            Spacer()
            
            
            Button {
            } label: {
                Label("카카오로 3초만에 로그인", systemImage: "apple.logo").foregroundColor(Color.black)
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow)
                .frame(width: 360, height: 50)
            )
            
            Spacer(minLength: 40)
            
            Button {
                
            } label: {
                Label("Apple로 로그인", systemImage: "apple.logo").foregroundColor(Color.white)
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .frame(width: 360, height: 50)
            )

            
            
        }
    }
}
    

struct OnBoardContent: View{
    var onboardText: String
    var onboardLabel: String
    var image: String
    
    var body: some View{
        VStack{
            Text(onboardText)
            Text(onboardLabel)
                .font(.system(size: 15, weight: .bold))
            Image(image)
                .resizable()
                .padding(EdgeInsets(top: 15, leading: 50, bottom: 250, trailing: 50))
                
                
        }
    }
}
    

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
