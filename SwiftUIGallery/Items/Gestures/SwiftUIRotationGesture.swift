//
//  SwiftUIRotationGesture.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIRotationGesture: View {
    @State var angle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Rotation (pinch/rotate)")
                .rotationEffect(self.angle)
                .gesture(rotation)
            Spacer()
            Image("Ragdoll")
                .frame(width: 300, height: 300, alignment: .center)
                .rotationEffect(self.angle)
                .gesture(rotation)
            Spacer()
        }
    }
}

struct SwiftUIRotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIRotationGesture()
    }
}
