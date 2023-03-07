//
//  ContentView.swift
//  TodaySwiftUI
//
//  Created by 김경호 on 2023/03/06.
//

import SwiftUI

struct Person: Identifiable{
    var id = UUID()
    let name: String
    let imageName: String
}

struct ContentView: View {
    var body: some View {
        
        List{
            Section {
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                HStack{
                    Image(systemName: "heart.fill")
                    Text("Leeo")
                }
                HStack{
                    Image(systemName: "bolt")
                    Text("Steave")
                }
            } header: {
                Text("Header")
            } footer: {
                Text("Foolter")
            }

            
            Section{
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                HStack{
                    Image(systemName: "heart.fill")
                    Text("Leeo")
                }
                HStack{
                    Image(systemName: "bolt")
                    Text("Steave")
                }
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                
            }
            
            Section{
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                HStack{
                    Image(systemName: "heart")
                    Text("Huko")
                }
                
            }
        }
        
//        List{
//            HStack{
//                Image(systemName: "heart")
//                Text("Huko")
//            }
//
//            HStack{
//                Image(systemName: "heart.fill")
//                Text("Dodo")
//            }
//            HStack{
//                Image(systemName:"bolt")
//                Text("Olivia")
//            }
//        }
//        .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
