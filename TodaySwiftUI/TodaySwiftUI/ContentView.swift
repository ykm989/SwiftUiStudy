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
        
        let people: [Person] = [Person(name: "Leeo", imageName: "heart"), Person(name: "Huko", imageName: "heart.fill"), Person(name: "Steave", imageName: "bolt")]
        
        List(people) { person in
            HStack{
                Image(systemName: person.imageName)
                Text(person.name)
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
