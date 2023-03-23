//
//  PropertyStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/22.
//

import SwiftUI

// propertyWapper
// 그 행동을 정의하는 타입을 하나 만드는 역활

//propertyWrapper 사용 안하는 경우
//struct Address{
//    private var _town: String = ""
//
//    // 공통되는 로직
//    var town: String{
//        get { self._town.uppercased() }
//        set { self._town = newValue }
//    }
//
//    init(town: String) {
//        self.town = town
//    }
//}
//
//struct Person{
//    private var _name: String = ""
//
//    // 공통되는 로직
//    var name: String{
//        get { self._name.uppercased() }
//        set { self._name = newValue }
//    }
//
//    init(name: String) {
//        self.name = name
//    }
//}

// propertyWrapper 사용 하는 경우
//@propertyWrapper
//struct Uppercase {
//    private var value: String = ""
//
//    var wrappedValue: String{
//        get { self.value }
//        set { self.value = newValue.uppercased() }
//    }
//
//    init(wrappedValue initialValue: String) {
//        self.wrappedValue = initialValue
//    }
//}
//
//struct Address {
//    @Uppercase var town: String
//}
//
//struct Person{
//    @Uppercase var name: String
//}

// 같은 로직을 하나의 프로퍼티에 연결할 수 있다.

//// ObservableObject & EnvironmnetObject
//class TimeData : ObservableObject {
//    @Published var timeCount = 0
//
//
//    @objc func timeCountPlus(){
//        timeCount += 1
//    }
//
//    func resetCount(){
//        timeCount = 0
//    }
//}
//
//struct TimerView: View {
//    @ObservedObject var timeData: TimeData // ObservableObject를 받는다. Static하게 사용가능
//    @StateObject var timeData // ObservedObejct랑 같은 역활을 하지만
//    @EnvironmnetObject var timeData: TimeData // 환경 변수를 만든다.
//
//    var body: some View{
//        Button {
//            timerData.timeCountPlus()
//        } label: {
//            Text("\(timerData.timeCount)")
//            Secon
//        }
//
//    }
//}
//
//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView().environmentObject(TimerData())
//    }
//}


// StateObject vs ObservedObject
final class Counter: ObservableObject{
    @Published var count = 0
    
    func incrementCounter(){
        count += 1
    }
}

struct PropertyStudy: View {
    @ObservedObject var counter = Counter()
//    @StateObject var counter = Counter()
    
    
    var body: some View {
        VStack{
            Text("Count : \(counter.count)")

            Button {
                counter.incrementCounter()
            } label: {
                Text("+")
            }

        }
    }
}

struct RandomNumberView: View{
    @State var randomNumber = 0
    
    var body: some View{
        VStack{
            // State의 값이 변경되면 그걸 인식해서 뷰를 다시 그린다.
            // 이때 ObservedObject면 Counter가 초기화 됨
            // StateObject면 Counter가 보존된다.
            Text("Random number is : \(randomNumber)")
            Button("Random Button"){
                randomNumber = (0...100).randomElement()!
            }
            
            PropertyStudy().padding()
        }
        
        
    }
    
}

struct PropertyStudy_Previews: PreviewProvider {
    static var previews: some View {
//        PropertyStudy()
        RandomNumberView()
//        StateExample()
    }
}

// State, Binding예시
struct StateExample: View{
    @State private var stateValue: Bool = false
    
    
    var body: some View{
        VStack{
            BindingExample(bindingValue: $stateValue) // binding해준다.
//            BindingExample(bindingValue: stateValue) // 값을 넘겨주는건 문제가 안되는데
            
            Text(stateValue ? "True" : "False")
        }
    }
}

struct BindingExample: View{
    @Binding var bindingValue: Bool // Binding으로 받기 위한 변수
//    var bindingValue: Bool = false
    
    var body: some View{
        Button {
            bindingValue.toggle() // 바인딩이 아니라 값 자체를 넘겨 받는 경우 Cannot use mutating member on immutable value: 'self' is immutable 즉 변경할 수 없는 값을 변경할려고 해서 생기는 문제 바인딩이 아니라 하위 뷰에서는 값을 변경할 수 없다.
            
        } label: {
            Text(bindingValue ? "True" : "False") // 값을 읽는것은 가능하다.
        }

    }
    
}


/*
 SwiftUIProperty Wrapper List
 propertyWrapper란? 특정 프로퍼티를 만들고 그걸 연결 하는 것
 
 1. State
 SwiftUI는 @State로 선언한 속성을 관리하여 값이 변경되면 값에 종속된 뷰 계층을 업데이트
 @State는 인스턴스 값이 아니라, 값을 읽고 쓰는 수단
 State를 하위 뷰에 전달하면, 상위 뷰에서 변경된 State로 하위 뷰를 업데이트하지만 하위 뷰는 값 변경 불가능 -> 이를 위해 @Binding을 사용
 State는 항상 private로 계층 중 가장 상위 뷰에 배치
 SSOT
 
 2. Binding
 SSOT가 가진 값을 읽고 쓸 수 있는 Property Wrapper
 
 3. Environment
 SwiftUI에서는 뷰를 구성하는 데 필요한 각종 환경 설정과 관련된 정보를 EnvironmentValues 타입이 관리
 
 뷰의 Environment에 저장된 값을 읽기 위해 사용
 선언할 때 EnvironmentValues keyPath를 사용하여 읽을 값을 지정
 프로퍼티의 wrappedValue에서 값을 읽고, 뷰의 내용을 조정
 값 변경 시 SwiftUI가 이를 참조한 모든 뷰를 업데이트
 
 4. EnvironmentObject
 State말고도 EnviromentObject로 정의하면 다른 뷰에서도 사용 가능
 사용자 인터페이스 밖에 있으며 앱 내의 SwiftUI 뷰 구조체의 하위 뷰에만 필요한 데이터는 Observable 오브젝트를 이용
 사용자 인터페이스 밖에 있으며 여러 뷰에서 접근해야 하는 데이터는 Environment 오브젝트를 활용
 
 5. ObservedObject
 클래스나 struct를 static하게 사용 가능
 
 6. StateObject
 StateObject는 IOS 14부터 등장해서 ObservedObject를 대체하는 느낌이다.
 StateObject는 ObservedObject와 유사하지만, 이 StateObject는 하나의 객체로 만들어지고, View가 얼마나 초기화되든지 상관없이 별개의 객체로 관리된다.
 ObservedObject를 인스턴스화시켜준다.
 
 */
