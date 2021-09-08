//
//  SwiftUIImages.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

import SwiftUI

struct SwiftUILinks: View {
    var body: some View {
        //iOS 15/XC 13 way, using markdown in the next field
//        Text("[Stackoverflow](https://stackoverflow.com)")
        NavigationView(){
            VStack{
                Spacer()
                Text("URL")
                HStack{
                    Link("🔗  Distant Suns trailer",
                         destination: URL(string: "https://www.youtube.com/watch?v=2zeN63hZaFQ")!).font(.system(size: 35.0,weight:.light))
                }
                
            let destination = SwiftUISliders()
                Divider().opacity(0.0)
                Text("Navigation Link")
                NavigationLink(
                    destination: destination
                )
                {
                    Text("show slider page").font(.system(size: 35.0,weight: .light))
                }
                Spacer()
                Spacer()
            }
        }.navigationBarTitle("Links", displayMode: .inline)

    }
}

struct SwiftUILinks_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILinks()
    }
}
