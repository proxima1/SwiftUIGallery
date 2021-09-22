// SwiftUILabels

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
                Section(header: Text("Basic")){
                    Label("Rain", systemImage: "cloud.rain")
                }
                Section(header: Text("Styles")){
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
        }.padding().navigationBarTitle("Labels", displayMode: .inline)
    }
}

struct SwiftUILabels_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILabels()
    }
}
