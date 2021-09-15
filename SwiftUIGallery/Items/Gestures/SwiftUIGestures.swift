//
//  SwiftUIGestures.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIZoomGesture: View {
    @State var angle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(self.angle)
            .gesture(rotation)
    }
}

struct SwiftUIGesturesx : View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    @State private var isPressed = false

    @GestureState private var longPressTap = false

    @GestureState var scale: CGFloat = 1.0
    @State private var isUnlocked = false
    
    var body: some View {
//        Image("Ragdoll")
//                    .font(.system(size: 200))
//                    .scaleEffect(isPressed ? 1.0 : 2.0)
//                    .animation(.easeInOut)
//                    .opacity(longPressTap ? 0.4 : 1.0)
//                    .foregroundColor(.green)
//                    .gesture(
//                        LongPressGesture(minimumDuration: 0.7)
//                                 .updating($longPressTap, body: { (currentState, state, transaction) in
//                                     state = currentState
//                                 })
//                                 .onEnded({ _ in
//                                     self.isPressed.toggle()
//                                 })
//                    )
        VStack {
            Image("Ragdoll")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .top)
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
            
            
//        Spacer()
//        VStack {
            Text("Is lock: \(isUnlocked.description)")
            Image(systemName: isUnlocked ? "lock" : "lock.open")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .onLongPressGesture {
                    self.isUnlocked.toggle()
            }
        }
//        Spacer()
    }
}

//struct SwiftUIGestures: View {
//    @GestureState var isLongPressed = false
//
//    @State private var currentAmount: CGFloat = 0
//    @State private var finalAmount: CGFloat = 1
//
//    var body: some View {
//        let longPress = LongPressGesture()
//            .updating($isLongPressed) { value, state, transaction in
//                state = value
//            }
//
//        Text("Hello, Worldxxx!")
//            .scaleEffect(5.0+finalAmount + currentAmount)
//                    .gesture(
//                        MagnificationGesture()
//                            .onChanged { amount in
//                                self.currentAmount = amount - 1
//                            }
//                            .onEnded { amount in
//                                self.finalAmount += self.currentAmount
//                                self.currentAmount = 0
//                            }
//                    )
//
////                return Image("Ragdoll")
////                    .frame(width: 300, height: 300)
////                    .cornerRadius(8)
////                    .shadow(radius: 8)
////                    .padding()
////                    .scaleEffect(isLongPressed ? 1.7 : 1)
////                    .gesture(longPress)
////                    .animation(.interactiveSpring(), value: isLongPressed)
//    }
//}

struct SwiftUIGestures_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGestures()
    }
}
