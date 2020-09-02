//
//  ContentView.swift
//  CustomList
//
//  Created by YoujinMac on 2020/09/02.
//  Copyright © 2020 YoujinMac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                List {
                    Section(
                        header: Text("section1").foregroundColor(.black)
                            .frame(width: geometry.size.width * 1.3, height: 30)
                            .background(Color.white)
                    ) {
                        Text("Cell")
                        Text("Cell")
                        Text("Cell")
                    }
                    
                }
                .modifier(listsSetup())
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
                
            }
            
            GeometryReader { geometry in
                List {
                    Section(
                        header: Text("section2").foregroundColor(.black)
                            .frame(width: geometry.size.width * 1.3, height: 30)
                            .background(Color.white)
                    ) {
                        Text("Cell")
                        Text("Cell")
                        Text("Cell")
                    }
                    
                }
                .modifier(listsSetup())
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor.clear
                }
            }
        }
        .background(Color.gray)
    }
}

extension ContentView {
    // 뒤에 백그라운드로 들어갈 라운드 들어갈 네모 Modifier
    struct listsSetup: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .frame(maxHeight: UIScreen.main.bounds.size.height/3)
                .background(
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
                    //.stroke(Color.blue, lineWidth: 1)
            )
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
