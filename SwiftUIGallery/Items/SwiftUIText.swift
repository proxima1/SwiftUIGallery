//
//  SwiftUIText.swift
//  SwiftUIGallery
//
//  Created by mike on 8/17/21.
//

import SwiftUI

struct SwiftUIText: View {
    @State private var username = ""
    @State var isEditing = false
    @State private var password = ""
    
    var body: some View {
        VStack{
        Form{
            Section(header: Text("Text"))
            {
                Text("Plain Text")
                HStack{
                    Text(verbatim:"Weight:").fontWeight(.medium).font(.system(size: 15.0))
                    Text(verbatim:"ultralight").fontWeight(.ultraLight).font(.system(size: 15.0))
                    Text(verbatim:"thin").fontWeight(.thin).font(.system(size: 15.0))
                    Text(verbatim:"light").fontWeight(.light).font(.system(size: 15.0))
                    Text(verbatim:"regular").fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"medium").fontWeight(.medium).font(.system(size: 15.0))
                    
                    //                Text(verbatim: mission.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: fontSize))
                }
                
                HStack{
                    Text(verbatim:"semibold").fontWeight(.semibold).font(.system(size: 15.0))
                    Text(verbatim:"bold").fontWeight(.bold).font(.system(size: 15.0))
                    Text(verbatim:"heavy").fontWeight(.heavy).font(.system(size: 15.0))
                    Text(verbatim:"black").fontWeight(.black).font(.system(size: 15.0))
                    
                }
                HStack{
                    Text(verbatim:"Size:").fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"15").fontWeight(.regular).font(.system(size: 25.0))
                    Text(verbatim:"20").fontWeight(.regular).font(.system(size: 30.0))
                    Text(verbatim:"25").fontWeight(.regular).font(.system(size: 35.0))
                    
                }
                
                HStack{
                    Text(verbatim:"Style:").fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"italic").italic().fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"underlined").underline().fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"strikethrough").strikethrough(true,color: Color.red).fontWeight(.regular).font(.system(size: 15.0))
                }
                
                HStack{
                    Text(verbatim:"Design:").fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"standard").fontWeight(.regular).font(.system(size:20.0))
                    Text(verbatim:"monospace").fontWeight(.regular).font(.system(size: 20.0,design: .monospaced))
                    Text(verbatim:"serif").fontWeight(.regular).font(.system(size: 20.0,design: .serif))
                    
                    //                    Text(verbatim:"strikethrough").strikethrough(true,color: Color.red).fontWeight(.regular).font(.system(size: 15.0))
                }
                
                HStack{
                    Text(verbatim:"rounded: ").fontWeight(.regular).font(.system(size: 15.0))
                    Text(verbatim:"abcd").fontWeight(.regular).font(.system(size: 50.0,design: .rounded))
                    Text(verbatim:"!abcd").fontWeight(.regular).font(.system(size: 50.0))
                }
            }
            
            Section(header: Text("Typefaces")){
                
                Text(verbatim:"Helvetica Neue").font(.title3).foregroundColor(Color.black).multilineTextAlignment(.leading).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/).blur(radius: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                Text(verbatim:"Ariel").fontWeight(.regular).font(.custom("Courier",size:20))
                Text(verbatim:"Courier").fontWeight(.regular).font(.custom("Courier",size:20))
                Text(verbatim:"Times New Roman").fontWeight(.regular).font(.custom("Times New Roman",size:20))
                Text(verbatim:"Avenir").fontWeight(.regular).font(.custom("Avenir",size:20))
                Text(verbatim:"Chalkboard").fontWeight(.regular).font(.custom("Chalkboard",size:20))
                
                Text(verbatim:"Bradley Hand").fontWeight(.regular).font(.custom("Bradley Hand",size:20))
                Text(verbatim:"Desdemona").fontWeight(.regular).font(.custom("Desdemona",size:20))
                Text(verbatim:"Bodoni Ornaments").fontWeight(.regular).font(.custom("Bodoni Ornaments",size:20)).foregroundColor(Color("DarkBlue"))
                Text(verbatim:"Papyrus").fontWeight(.regular).font(.custom("Papyrus",size:20)).foregroundColor(.blue)
            }
            
            Section(header: Text("Styles")){
                Group{
                    Text(verbatim:"Large Title").fontWeight(.regular).font(.largeTitle)
                    Text(verbatim:"Title").fontWeight(.regular).font(.title)
                    Text(verbatim:"Title2").fontWeight(.regular).font(.title2)
                    Text(verbatim:"Title3").fontWeight(.regular).font(.title3)
                    Text(verbatim:"Headline").fontWeight(.regular).font(.headline)
                    Text(verbatim:"Subheadline").fontWeight(.regular).font(.subheadline)
                }
                
                Group{
                    Text(verbatim:"Body").fontWeight(.regular).font(.body)
                    Text(verbatim:"Callout").fontWeight(.regular).font(.callout)
                    Text(verbatim:"Footnote").fontWeight(.regular).font(.footnote)
                    Text(verbatim:"Caption").fontWeight(.regular).font(.caption)
                    Text(verbatim:"Caption2").fontWeight(.regular).font(.caption2)
                }
                
                //                Text(verbatim:"Large").fontWeight(.regular).font(.largeTitle)
                
            }
            
            Section(header: Text("TextField")){
                TextField(
                    "User name (email address)",
                    text: $username
                ) { isEditing in
                    self.isEditing = isEditing
                } onCommit: {
                    print("Logging In: \(username)")
                }
                .padding(EdgeInsets(top:0, leading:20.0, bottom:0.0, trailing:10.0))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.gray))
                Text(username)
                    .foregroundColor(isEditing ? .red : .blue)
            }
            
            Section(header: Text("SecureField")){
                SecureField(
                        "Password",
                        text: $password
                )
            }
 
            .border(Color(UIColor.separator))
        }}.padding(2.0)
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
