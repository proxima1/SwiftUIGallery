
//  SwiftUIText.swift

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

struct SectionTitle: ViewModifier
{
    func body(content: Content)->some View
    {
        return content
            .shadow(color: Color.black.opacity(0.2), radius: 0.75, x: -1.5, y:-0.5)
            .foregroundColor(Color(.red))
            .fontWeight(.light)
            .font(Font.custom("Futura", size: 15.0))
    }
}

struct SwiftUIText: View {
    @State private var username = ""
    @State var isEditing = false
    @State private var password = ""
    @State var longString = "If in a line-limited TextField, this will overflow, but be scrollable. \r\rWhere does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Text").modifier(SectionTitle()))
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
                    
                    Text(verbatim:"Multiline (TBA): (ios16)").fontWeight(.medium).font(.system(size: 15.0))
                    
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
                
                Section(header: Text("Typefaces").modifier(SectionTitle())){
                    
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
                
                Section(header: Text("Styles").modifier(SectionTitle())){
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
                }
                
                Section(header: Text("TextField: Simple").modifier(SectionTitle())){
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
                
                Section(header: Text("TextField: Limited Multiline").modifier(SectionTitle())){
                    TextField(
                        "Lorem",
                        text: $longString,
                        axis: .vertical
                    ).lineLimit(...5)
                        .multilineTextAlignment(.leading)
                }

                Section(header: Text("Text: Multiline").modifier(SectionTitle())){
                    multiLineText().lineLimit(5)
                }
                
                Section(header: Text("SecureField").modifier(SectionTitle())){
                    secureField()
                }.border(Color(UIColor.separator))

                
                Section(header: Text("Attributed").modifier(SectionTitle())){
                    attributedText()
                }
            }
        }.padding(2.0).navigationBarTitle("Text", displayMode: .inline)
    }
}

struct secureField: View {
    @State private var password = ""

    var body: some View {
        SecureField(
            "Password",
            text: $password
        )
    }
}

struct secureFieldtest: View {
    var title: String = ""

    var body: some  View
    {
        VStack{
            Text("Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.")
            
//                                Text("Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 300)
                              
        }
    }
}

struct multiLineText: View
{
    var title: String = ""
    let text = "This is a non-editiable Text object. For some reson it doesn't want to scroll if it has more than the line limit, which Textfield understands.\r\n\nLorem Ipsum? Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."

    var body: some  View
    {
        VStack{
            Text(text)
                .font(.callout).lineLimit(7).italic()
                .multilineTextAlignment(.leading)
                .frame(width: 300)

        }
    }
}

struct attributedText: View{
    var title: String = ""
    
//    var attributedString = AttributedString("The first month of your subscription is free.")
//    let range = attributedString.range(of: "subscription")!
//    attributedString[range].foregroundColor = .green
    
    var body: some  View
    {
        VStack{
            buildSimpleAttributedStrings()
            buildMarkupAttributedString()
        }
    }
    
    func buildSimpleAttributedStrings()->some View{
        
        var attributedString = AttributedString("The first month of your subscription is free.")
        var range = attributedString.range(of: "free")!
        attributedString[range].foregroundColor = .green
        range = attributedString.range(of: "subscription")!
        attributedString[range].foregroundColor = .blue
        attributedString[range].underlineStyle = Text.LineStyle(pattern: .solid, color: .blue)

        var text1=Text(attributedString)
        
        return text1
    }
    
    func buildMarkupAttributedString()->some View{
        
        var attributedString = try! AttributedString(markdown: "Using **Markdown:** The first **month** of your subscription is _free._")
        var range = attributedString.range(of: "free")!
        attributedString[range].foregroundColor = .green
        range = attributedString.range(of: "subscription")!
        attributedString[range].foregroundColor = .blue
        attributedString[range].underlineStyle = Text.LineStyle(pattern: .solid, color: .red)
        var text1=Text(attributedString)
        
        return text1
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
