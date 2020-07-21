//
//  TextFieldContentView.swift
//  SwiftUI_Test
//
//  Created by YoujinMac on 2020/07/21.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct TextFieldContentView: View {
        //@State var touchedCount = 0
    @State var name = ""
    @State var age = ""
    @State var email = ""
    @State var changeText = ""
    @State var changeColor: Color = .white//.gray
    
    @State var editingFlag = ""
    @State var oncommitText = ""
    
    var body: some View {
            Form {
                Section {
                    TextField("이름을 입력해주세요", text: $name).keyboardType(.default)
                    TextField("나이를 입력해주세요", text: $age).keyboardType(.numberPad)
                    TextField("email", text: $email).keyboardType(.emailAddress)
                }
                
                Section {
                    Text("이름: \(name)")
                    Text("나이: \(age)")
                    Text("email: \(email)")
                }
                
                Section {
                    TextField("수행중입니다.",
                              text: $changeText,
                              onEditingChanged: {
                                if $0 == true {
                                    self.editingFlag = "작성중.."
                                    print("작성중")
                                } else {
                                    self.editingFlag = "작성중 완료."
                                    print("작성 완료")
                                }
                    },
                              onCommit:  {      // 약간의 애니메이션..?
                                self.changeColor = .gray
                                self.oncommitText = "onCommit"
                                print("onCommit")
                    })
                    Text("text: \(changeText),onEditingChanged: \(editingFlag)")
                    Text("onCommit: \(oncommitText)")
                    // text 입력 시: 작성중 -> onCommit -> 작성완료 순서
                    // 입력안하고 선택 해제 시: 작성중 -> 작성완료
                }
            }.colorMultiply(changeColor)
        
    }
}

struct TextFieldContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldContentView()
    }
}
