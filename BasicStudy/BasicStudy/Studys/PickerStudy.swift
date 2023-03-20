//
//  PickerStudy.swift
//  BasicStudy
//
//  Created by 김경호 on 2023/03/20.
//

import SwiftUI

struct PickerStudy: View {
    var options = ["Option1", "Option2", "Option3", "Option3", "Option4"]
    @State private var selectionOption = 0
    @State var date = Date()
    @State var color = Color.green
    
    var body: some View {
        VStack{
            // State와 바인딩 해준 후 넣어준다.
            Picker("Select Choice", selection: $selectionOption){
                ForEach(0..<options.count){
                    Text(options[$0])
                }
            }
            
            Picker("Select Choice", selection: $selectionOption){
                ForEach(options, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.wheel)
            
            Picker("Select Choice", selection: $selectionOption){
                ForEach(0..<options.count){
                    Text(options[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            DatePicker("DatePicker", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.wheel)
//                .datePickerStyle(.automatic)
//                .datePickerStyle(.graphical)
            
            ColorPicker("ColorPicker", selection: $color)
            
        }
    }
}

struct PickerStudy_Previews: PreviewProvider {
    static var previews: some View {
        PickerStudy()
    }
}
