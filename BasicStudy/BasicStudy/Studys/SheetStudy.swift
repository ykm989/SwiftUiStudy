//
//  SheetStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct SheetStudy: View {
    @State private var sheetOn: Bool = false
    @State private var presentValue: Bool = false
    
    
    var body: some View {
        VStack{
//            Button {
//                presentValue.toggle()
//            } label: {
//                Text("화면 전환")
//            }
            
            Button {
                sheetOn.toggle()
            } label: {
                Text("Sheet Button")
            }
//            // alert 구현 ios 13, 14버전까지
//            .alert(isPresented: $sheetOn){
//                Alert(title: Text("Alert Title"), message: Text("Alert Study!"), dismissButton: .default(Text("Dismiss")))
//            }
            // alert 구현 ios 15 버전부터는 이렇게 구현
//            .alert("메시지", isPresented: $sheetOn){
//                Button("OK", role: .cancel){}
            }
            //        뷰를 불러온다.
            .sheet(isPresented: $sheetOn) {
                SecondView()
            }
            // Action Sheet
//            .actionSheet(isPresented: $sheetOn){
//                ActionSheet(title: Text("Action Sheet"), message: Text("골라보세요."), buttons: [.default(Text("Dismiss")), .cancel(Text("Cancel"))])
//            }
            
            
            // 아래 코드는 에러가 난다. 이유는 하나의 sheet에 여러개의 뷰를 넣는것이 불가능하기 떄문이다.
//            .sheet(isPresented: $sheetOn) {
//                presentValue ? SecondView() : ThirdView()
//            }
            //        풀스크린으로 불러온다 sheet와 같은 역활
            //        .fullScreenCover(isPresented: $sheetOn) {
            //            SecondView()
            //        }
            
            
            // transition을 이용해서 구현 가능
//            if sheetOn{
//                SecondView()
//                    .transition(AnyTransition.move(edge: .bottom))
//                    .animation(.spring())
//            }
            
//            ThirdView()
//                .offset(y: sheetOn ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring())
        }
    }
    
}

struct SheetStudy_Previews: PreviewProvider {
    static var previews: some View {
        SheetStudy()
    }
}

struct SecondView: View{
    @Environment(\.presentationMode) var presentationMode // 닫는 버튼을 가져온다.
    
    var body: some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Close")
            }
            .frame(width:100, height: 50)
            .background(Color.white).cornerRadius(5)

        }
    }
}

struct ThirdView: View{
    @Environment(\.presentationMode) var presentationMode // 닫는 버튼을 가져온다.
    
    var body: some View{
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Close")
            }
            .frame(width:100, height: 50)
            .background(Color.white).cornerRadius(5)

        }
    }
}

/*
 Sheet안에 조건문을 달아서 여러개의 View를 나타내기는 불가능
 */
