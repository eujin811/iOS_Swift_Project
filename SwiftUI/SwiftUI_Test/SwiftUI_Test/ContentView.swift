//
//  ContentView.swift
//  SwiftUI_Test
//
//  Created by YoujinMac on 2020/07/21.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        HStack {
//            Text("Hello").foregroundColor(.white)
//            Text("Hello1").colorMultiply(.red).colorScheme(.dark)
//            Text("Hello2").colorMultiply(.red).colorScheme(.light)
////            TexT("Hello")
//        }.background(Color.gray)//.background(Color.gray)
        
        VStack {
            Text("Hello").foregroundColor(.white)
            Text("Hello1").colorMultiply(.red).colorScheme(.dark)
            Text("Hello2").colorMultiply(.red).colorScheme(.light)
        }.background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
