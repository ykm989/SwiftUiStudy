//
//  MainView.swift
//  HMC
//
//  Created by 김경호 on 2023/03/27.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "house"
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom,content: {
            Color("MainColor").ignoresSafeArea(.all)
            
            switch selectedTab{
            case "house":
                HomeView(viewModel: viewModel)
            case "list.clipboard":
                RecordView()
            default:
                MapView()
            }
            

            CustomTabBar(selectedTab: $selectedTab).padding(.bottom)
        })
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .preferredColorScheme(.dark)
    }
}
