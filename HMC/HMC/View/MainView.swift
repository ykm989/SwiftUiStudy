//
//  MainView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .bottom,content: {
            Color("MainColor").ignoresSafeArea(.all)
            
            switch selectedTab{
            case "house":
                HomeView()
            case "clipboard.list":
                RecordView()
            default:
                RecordView()
            }
            

            CustomTabBar(selectedTab: $selectedTab)
        })
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .preferredColorScheme(.dark)
    }
}
