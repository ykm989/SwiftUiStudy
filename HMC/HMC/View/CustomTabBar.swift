//
//  CustomTabBar.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//
// https://www.youtube.com/watch?v=TJfI3-qdta8 강의 보고 따라 만듬

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @State var tabPoints : [CGFloat] = []
    
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TabBarButton(image: "list.clipboard", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
            TabBarButton(image: "map", selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(Color.white
            .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(Color.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
            ,alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvePoint() -> CGFloat{
        if tabPoints.isEmpty{
            return 10
        } else {
            switch selectedTab{
            case "house":
                return tabPoints[0]
            case "list.clipboard":
                return tabPoints[1]
            case "map":
                return tabPoints[2]
            default:
                return tabPoints[3]
            }
        }
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TabBarButton: View{
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View{
        GeometryReader { reader -> AnyView in
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4{
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                Button {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                } label: {
//                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")") 애니메이션이 끊김
                    Image(systemName: "\(image)")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color.blue)
                        .offset(y: selectedTab == image ? -10 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )

        }
        .frame(height: 50)
    }
}
