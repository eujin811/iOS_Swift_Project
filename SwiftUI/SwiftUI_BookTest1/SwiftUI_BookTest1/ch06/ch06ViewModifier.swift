//
//  ch05ViewModifier.swift
//  SwiftUI_BookTest1
//
//  Created by YoujinMac on 2020/08/05.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ch05ViewModifier: View {
    var body: some View {
        Text("Custom ViewModifier").modifier(CustomViewModifier(borderColor: .red))
    }
}

struct ch05ViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        ch05ViewModifier()
    }
}


struct CustomViewModifier: ViewModifier {
    var borderColor: Color = .red
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.white)
            .padding()
            .background(Rectangle().fill(Color.gray))
            .border(borderColor, width: 2)
    }
}
