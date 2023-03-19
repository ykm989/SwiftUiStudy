//
//  Onboard.swift
//  TextureUiClone
//
//  Created by 김경호 on 2023/03/15.
//

import SwiftUI

struct Onboard: View {
    let title: String
    let contents1: String
    let contents2: String
    let contents3: String
    let image: Image
    
    var title1: AttributedString{
        var result = AttributedString(title)
        result.font = .systemFont(ofSize: 55, weight: .bold)
        
        return result
    }
    var title2: AttributedString{
        var result = AttributedString(".")
        result.foregroundColor = .green
        result.font = .systemFont(ofSize: 55, weight: .bold)
        
        
        return result
    }
    
    //.rotationEffect(Angle(degrees:Bool값 넣어주고 ? 180 : 0)
    // .withAnimaition()
    
    
    var body: some View {
        ZStack{
            Color("OnboardColor").edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 100)
                VStack{
                    Spacer()
                    Text(title1 + title2)
                        .frame(width: 300,alignment: .leading)
                        
                    Spacer(minLength: 40)
                    VStack{
                        Text(contents1)
                            .frame(width: 300,alignment: .leading)
                            .font(.system(size: 20))
                        Text(contents2)
                            .frame(width: 300, alignment: .leading)
                            .font(.system(size: 20))
                        Text(contents3)
                            .frame(width:300 ,alignment: .leading)
                            .font(.system(size: 20))
                    }
                }.frame(height:100)
                Spacer(minLength: 50)
                VStack{
                    Image(systemName: "bolt")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                    Spacer(minLength: 300)
                    Button {
                        print("hello")
                    } label: {
                        Text("시작하기")
                            
                    }
                    .frame(width: 400, height: 50)
                    .disabled(false)
                        
                        .background(.white)
                    Spacer()
                }.background(Color.blue)
                Spacer(minLength: 5)
                
            }
        }
    }
}

struct Onboard_Previews: PreviewProvider {
    static var previews: some View {
        Onboard(
            title: "Read",
            contents1: "책 속 문장으로 쉬운 독서를",
            contents2: "시작합니다. 마음에 드는 문장은",
            contents3: "스크랩으로 기록합니다.",
            image: Image(systemName: "bolt")
        )
        
    }
}
