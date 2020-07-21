//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by YoujinMac on 2020/07/21.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var birthYear = 0
    @State var genderFlag = 0
    @State var nationFlag = 0
    @State var birthDay = Date()
    
    let gender = ["F", "M", "Third gender"]
    let nation = ["Korea", "USA", "China", "Other"]
    
    var body: some View {
        NavigationView {
            Form {
                // 기본 picker
                Section(header: Text("생년월일")) {
                    Picker("출생년도", selection: $birthYear) {     // 선택한 변수 birth에 할당
                        ForEach(1910..<2020) {
                            Text("\(String($0))")
                        }
                    }
                }
                
                // Segment Picker
                Section(header: Text("성별")) {
                    Picker("성별", selection: $genderFlag) {      // 선택한 요소 몇번째 인지
                        ForEach(0..<gender.count) {
                            Text("\(self.gender[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                // wheel Picker
                Section(header: Text("국가")) {
                    Picker(selection: $nationFlag, label: Text("선택")) {
                        ForEach(0..<nation.count) {
                            Text(self.nation[$0])
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                // Date Picker
                Section(header: Text("생일")) {
                    DatePicker(selection: $birthDay, in: ...Date(), displayedComponents: .date) {
                        Text("BirthDay")
                    }
                    
                }
                                
            }.navigationBarTitle("회원가입")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
