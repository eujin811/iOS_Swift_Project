//
//  ButtonNaviContentView.swift
//  SwiftUI_Test
//
//  Created by YoujinMac on 2020/07/21.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ButtonNaviContentView: View {
       @State var touchedCount = 0
        var body: some View {
            NavigationView {
                Form {
                    //Text("Hi")
                    Text("Button Click \(touchedCount)")
    
                    Button("Button1") {
                        //버튼 클릭시 발생하는 callback
                        self.touchedCount += 1
                    }
                    Group {         //view는 최대 10개의 Child View를 가질 수 있고 10개 초과 시 Group 혹은 Stack 컨테이너를 이용해 묶어주어야 한다.
                        Text("next Count \(touchedCount + 1)")
                        Text("Hell World")
                        Text("Hell World")
                        Text("Hell World")
                    }
                    

                }.navigationBarTitle("naviTitle")
            }
        }
}

struct ButtonNaviContentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNaviContentView()
    }
}
