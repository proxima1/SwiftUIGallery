//
//  SwiftUIMagnifyGesture.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIMagnifyGesture: View {
    
    @State private var currentAmount: CGFloat = 0
    @GestureState var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Text("Magnification (pinch)")
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                        .updating($scale, body: { (value, scale, trans) in
                            scale = value.magnitude
                        })
                        .onChanged { amount in
                            self.currentAmount = amount - 1
                            print("Text: onChange")
                        })
            Spacer()
            Image("Ragdoll")
                .resizable()
                .scaledToFit()
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
            Spacer()
        }
    }
}

struct SwiftUIMagnifyGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIMagnifyGesture()
    }
}
