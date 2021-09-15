//
//  SwiftUIViewBuilder.swift
//  SwiftUIGallery
//
//  Created by mike on 9/9/21.
//

import SwiftUI

struct SwiftUIViewBuilder: View {
    var body: some View {
        VStack{
            Spacer()
            
            NotAViewbuilder()
            
            Spacer()
            
            IsAViewbuilder{
                Text("I'm in the group 😁")
                Text("Me too 🥂")
                Label("I can pass an abitrary number of views",systemImage:"snow")
                vbExampleButton(labelText: "VB Button")
            }
            Spacer()
        }
    }
}


struct NotAViewbuilder: View  {

    var body: some View {
        VStack {
            Text("I'm in Not a Viewbuilder")
            Text("I am too!")
        }
    }
}

struct IsAViewbuilder<Content>: View where Content: View {
    var views: Content

    init(@ViewBuilder content: () -> Content) {
        self.views = content()
    }

    var body: some View {
        Group {
            views.foregroundColor(.green)
        }
    }
}

struct vbExampleButton: View {
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("hit \n(labelText)")
        }){
            Text(labelText)
                .foregroundColor(.black).bold().padding()
                .frame(width:200,height:50)
                .background(Color.white)
                .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
        }
    }
}

struct SwiftUIViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewBuilder()
    }
}
