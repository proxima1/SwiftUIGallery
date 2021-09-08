//
//  SwiftUITextEditor.swift
//  SwiftUIGallery
//
//  Created by mike on 8/13/21.
//

import SwiftUI

struct SwiftUITextEditor: View {
    @State private var someText: String  = "\n****  COMMODORE 64 BASIC X2  ****\n64K RAM SYSTEM 38911 BASIC BYTES FREE\nREADY. 🀫 "

    init()
    {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack{
        TextEditor(text: $someText)
            .multilineTextAlignment(.center)
            .background(Color(.sRGB,red:0.0,green:0.0,blue:0.6,opacity:1.0).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            .foregroundColor(Color(.sRGB,red:0.4,green:0.4,blue:1.0,opacity:1.0))
            .font(.headline)
            
//            Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }.navigationBarTitle("Text Editor", displayMode: .inline)
    }
}

struct SwiftUITextEditor_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextEditor()
    }
}
