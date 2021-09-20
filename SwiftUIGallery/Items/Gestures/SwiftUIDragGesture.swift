//
//  SwiftUIDragGesture.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUIDragGesture: View {
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
    
    var body: some View {
        ZStack{
            Text("Drag")
            Image("Ragdoll")
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.8),radius: 9, x: 4, y: 4)
                .position(location)
                .gesture(
                    simpleDrag
                )
        }
        
    }
}

struct SwiftUIDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDragGesture()
    }
}
