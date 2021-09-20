//
//  SwiftUILongPressGesture.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUILongPressGesture: View {
    
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    @State private var isPressed = false

    @GestureState private var longPressTap = false

    @GestureState var scale: CGFloat = 1.0
    @State private var isUnlocked = false
    
    var body: some View {
        VStack{
                Text("Long press")
                Spacer()
                Image("Ragdoll")
                            .font(.system(size: 200))
                            .scaleEffect(isPressed ? 1.0 : 2.0)
                            .animation(.easeInOut)
                            .opacity(longPressTap ? 0.4 : 1.0)
                            .foregroundColor(.green)
                            .gesture(
                                LongPressGesture(minimumDuration: 0.7)
                                         .updating($longPressTap, body: { (currentState, state, transaction) in
                                             state = currentState
                                         })
                                         .onEnded({ _ in
                                             self.isPressed.toggle()
                                         })
                            )
            Spacer()
        }
    }
}

struct SwiftUILongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILongPressGesture()
    }
}
