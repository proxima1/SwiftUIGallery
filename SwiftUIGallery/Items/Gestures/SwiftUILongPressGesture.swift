/*
 MIT License
 
 Copyright (c) 2021 Mike Smithwick
 
 Permission is hereby granted, free of charge,
 to any person obtaining a copy of this software
 and associated documentation files (the "Software"),
 to deal in the Software without restriction,
 including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so,
 subject to the following conditions:
 
 The above copyright notice and this permission notice
 shall be included in all copies or substantial portions
 of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
 USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

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
