//: A UIKit based Playground for presenting user interface
  
import PlaygroundSupport

import SwiftUI

struct ContentViewPlayground: View {
    var body: some View {
        Text("Hello swiftUI")
    }
}


// Present the view controller in the Live View window


// 1.

//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentViewPlayground())


// 2.

// func setLiveView<IncomingView>(_ newLiveView: IncomingView) where IncomingView: View
PlaygroundPage.current.setLiveView(ContentViewPlayground())
