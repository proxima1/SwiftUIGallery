//
//  SwiftUILabels.swift
//  SwiftUIGallery
//
//  Created by mike on 8/20/21.
//

import SwiftUI


struct CustomLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 8) {
            configuration.icon.frame(width:20.0,height:20.0)
                .scaleEffect(0.5)
                .padding()
            configuration.title
        }.frame(height:100.0)
    }
}

struct SwiftUILabels: View {
    var body: some View {
        VStack{
        Form{
            Section(header: Text("Basic"))
            {
                Label("Rain", systemImage: "cloud.rain")
            }
            Section(header: Text("Styles"))
            {
                VStack(alignment:.leading) {
                    Label("Rain", systemImage: "cloud.rain")
                    Label("Snow", systemImage: "snow")
                    Label("Sun", systemImage: "sun.max").labelStyle(/*@START_MENU_TOKEN@*/DefaultLabelStyle()/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("the text is suppresed using the iconsOnly labelstyle on just the VStack and not the individual labels. Cool.")
                }.labelStyle(IconOnlyLabelStyle())
                
            }
            Section(header: Text("Using Text and custom icon"))
            {
                Label {
                    Text("Higgs")
                        .font(.body)
                        .foregroundColor(.primary).padding()
                    Text("Boson")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } icon: {
                    Circle()
                        .fill(Color("Magenta"))
                        .frame(width: 60, height: 60, alignment: .center)
                        .overlay(Text("HB").fontWeight(.heavy).foregroundColor(Color("Cyan")).font(.system(size: 30.0)))
                }
            }
            Section(header: Text("Custom labelStyle"))
            {
                Label("Apollo 11", image: "Apollo 11").labelStyle(CustomLabelStyle())
            }
        }
        }.padding()
    }
}

struct SwiftUILabels_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILabels()
    }
}
