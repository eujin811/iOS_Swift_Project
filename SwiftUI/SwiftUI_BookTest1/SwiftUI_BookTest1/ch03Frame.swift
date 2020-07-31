//
//  ch03Frame.swift
//  SwiftUI_BookTest1
//
//  Created by YoujinMac on 2020/07/31.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ch03Frame: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Frame").background( Color.yellow).frame(width: 200, height: 100).border(Color.red)
            
            Rectangle().fill(Color.yellow).frame(width: 200, height: 100)
            
            Text("Frame").background(Color.yellow).frame(width: 200, height: 100, alignment: .leading).border(Color.red)
            
            Text("Frame").background(Color.yellow).frame(width: 200, height: 100, alignment: .trailing).border(Color.red)
            
        }
    }
}

struct ch03Frame_Previews: PreviewProvider {
    static var previews: some View {
        ch03Frame()
    }
}
