//
//  SwiftUIGestureManager.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIGestureManager: View {
    var body: some View {
            TabView {
                SwiftUIMagnifyGesture()
                    .tabItem {
                        Label("Magnify", systemImage: "magnifyingglass")
                    }

                SwiftUIRotationGesture()
                    .tabItem {
                        Label("Rotation", systemImage: "rotate.left")
                    }
                
                SwiftUILongPressGesture()
                    .tabItem {
                        Label("Long Press", systemImage: "arrow.down")
                    }
                
                SwiftUIDragGesture()
                    .tabItem {
                        Label("Drag", systemImage: "arrow.swap")
                    }
                
                SwiftUICompoundGestures()
                    .tabItem {
                        Label("Drag/Press", systemImage: "plus.square")
                    }
                
            }.navigationBarTitle("Tabs", displayMode: .inline)
        }
}

struct SwiftUIGestureManager_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGestureManager()
    }
}
