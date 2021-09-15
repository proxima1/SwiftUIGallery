//
//  SwiftUIMagnifyGesture.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIMagnifyGesture: View {
    
    @State private var currentAmount: CGFloat = 0
//    @State private var finalAmount: CGFloat = 1
//    @State private var isPressed = false

//    @GestureState private var longPressTap = false

    @GestureState var scale: CGFloat = 1.0
//    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            Image("Ragdoll")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                            .updating($scale, body: { (value, scale, trans) in
                                scale = value.magnitude
                            })
                            .onChanged { amount in
                                self.currentAmount = amount - 1
                                print("onChange")
                            }
                )
        }
    }
}

struct SwiftUIMagnifyGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMagnifyGesture()
    }
}
