//
//  ContentView.swift
//  SwiftUIBookText2
//
//  Created by YoujinMac on 2020/08/10.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("ch07")) {
                    NavigationLink(destination: ch07ScrollView()) {
                        Text("07 ScrollView")
                    }
                    NavigationLink(destination: ch07ScrollPage()) {
                        Text("07 Scroll Page")
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
