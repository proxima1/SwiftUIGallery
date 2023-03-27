
//  SwiftUIToolbars

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

struct ItemsToolbar: ToolbarContent {
    let add: () -> Void
    let sort: () -> Void
    let filter: () -> Void

    var body: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button("Spiny Lumpsucker 👍🏻", action: add)
        }

        ToolbarItemGroup(placement: .bottomBar) {
            Button("Wobbegong", action: sort)
            Button(action: filter)
            {
                Text("Streaked Tenrec")  //notice all of these attributes are ignored
                    //even though we're using a button
                    .foregroundColor(.black).italic().padding()
                    .background(Color.white)
                    .cornerRadius(40).shadow(color: Color.black.opacity(0.2),radius: 6, x: 4, y: 4)
            }
        }
    }
}

//two buttons on the  bottom

struct SwiftUIToolbars: View {
    @State var color = Color.red

    var body: some View{
//        topToolBarWithImagesLink()
//        TitleMenuExample()
//        topSimpleToolbar2(text: "howdy")
//        StructToolbarItemGroupView()
        customizableToolBar()
//        topToolBarWithLink()
//       topToolBarColorScheme()


    }
}
    
struct topToolBarWithLink: View {
    var body: some View{
        NavigationStack {
            VStack {
                NavigationLink {
                    Text("Detail").fontWeight(.medium).font(.system(size: 35.0))
                } label: {
                    Text("Click here").fontWeight(.medium).font(.system(size: 35.0))
                }
            }
            .toolbar {
                Button("Save") {
                    print("save document")
                }
            }
            .navigationBarTitleDisplayMode(.inline) //centered title. Use ".large" for a side title
            .navigationTitle("Home")
            .padding()
        }
    }
}

struct topToolBarWithImagesLink: View {
    var body: some View{
        NavigationStack {
            VStack {
                NavigationLink {
                    Text("Detail").fontWeight(.medium).font(.system(size: 35.0))
                } label: {
                    Text("Click here").fontWeight(.medium).font(.system(size: 35.0))
                }
            }
            .toolbar {
                Button(action: {print("hit button 1")}) {
                    Image(systemName: "mic.circle")
                }.fontWeight(.medium).font(.system(size: 20))
                
                Button(action: {print("hit button 2")}) {
                    Image(systemName: "person.crop.circle")
                }.fontWeight(.medium).font(.system(size: 20))
            }
            .navigationBarTitleDisplayMode(.inline) //centered title. Use ".large" for a side title
            .navigationTitle("Home")
            .padding()
            .padding()
            .frame(height: 10)
        }
    }
}

//from swiftwithmajid

struct TitleMenuExample: View {
    @State private var date = Date.now
    @State private var datePickerShown = false
    
    var body: some View {
        NavigationStack {
            Text(date, style: .date)
                .navigationTitle(Text(date, style: .date))
                .navigationBarTitleDisplayMode(.inline)
                .toolbarTitleMenu {
                    Button("Pick another date") {
                        datePickerShown = true
                    }
                }
                .sheet(isPresented: $datePickerShown) {
                    DatePicker(
                        "Choose date",
                        selection: $date,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                }
        }.toolbar{  //hmm.this is not showing...
            Button(action: {print("hit button 2")}) {
                Image(systemName: "person.crop.circle")
            }
        }
    }
}

struct StructToolbarItemGroupView: View {
    @State private var text = "Go Amiga!"
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 25.0

    var displayFont: Font {
        let font = Font.system(size: CGFloat(fontSize),
                               weight: bold == true ? .bold : .regular)
        return italic == true ? font.italic() : font
    }

    var body: some View {
        
        TextEditor(text: $text)
            .font(displayFont)
            .multilineTextAlignment(.center)
            .toolbar {
                ToolbarItemGroup {
                    Slider(
                        value: $fontSize,
                        in: 8...120,
                        minimumValueLabel:
                            Text("A").font(.system(size: 8)),
                        maximumValueLabel:
                            Text("A").font(.system(size: 16))
                    ) {
                        Text("Howdy (\(Int(fontSize)))")
                    }.frame(width: 150, height: 100)
                    
                    Toggle(isOn: $bold) {
                        Image(systemName: "bold")
                    }
                    Toggle(isOn: $italic) {
                        Image(systemName: "italic")
                    }
                }
            }
            .navigationTitle("My Note").foregroundColor(.red).font(.title)
    }
}

struct customizableToolBar: View {
    
    var body: some View {
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(id: "options") {
                    // this is a primary action, so will always be visible
                    ToolbarItem(id: "settings", placement: .primaryAction) {
                        Button("Settings") { }
                    }
                    
                    // this is a standard secondary action, so will be customizable
                    ToolbarItem(id: "help", placement: .secondaryAction) {
                        Button("Help") { }
                    }
                    
                    // another customizable button
                    ToolbarItem(id: "email", placement: .secondaryAction) {
                        Button("Email Me") { }
                    }
                    
                    // a third customizable button, but this one won't be in the toolbar by default
                    ToolbarItem(id: "credits", placement: .secondaryAction, showsByDefault: false) {
                        Button("Credits") { }
                    }
                }
                .toolbarRole(.editor)
        }
    }
}

struct deleteButton: View {
    
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("Hit \(labelText)")
        }){
            Text("Delete").foregroundColor(.blue).bold()
        }
    }
}

struct topSimpleToolbar2: View {
    var text: String
    
    var body: some View {
        NavigationView {
            Text("Higgs").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "person.crop.circle")
                    }
                }
        }
    }
}

struct bottomSimpleToolbar1: View {
    var text: String
    
    var body: some View {
        NavigationStack {
            Text("My app").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                }
        }
    }
}

struct bottomSimpleToolbar2: View {
    var text: String
    
    var body: some View {
        NavigationView {
            Text("My app").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Image(systemName: "person")
                        Spacer()
                        Image(systemName: "ellipsis")
                        Spacer()
                        Image(systemName: "trash")
                    }
                }
        }
    }
}

struct bottomSimpleToolbar3: View {
    var text: String
    
    var body: some View {
        NavigationView {
            Text("My app")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.yellow)
                            .mask(Circle())
                    }
                }
            }
        }
    }
}



struct searchView: View {
    var text: String

    var body: some View {
        Button(action:{
            print(text)
        }){
            
            Text(text).foregroundColor(.red).bold()
        }
    }
}



struct sortButton: View {
    var labelText: String
    
    var body: some View {
        Button(action:{
            print("Hit Label Button")
        }){
            Text(labelText).foregroundColor(.red).bold()
        }
    }
}
    
//    init() {
//      let coloredAppearance = UINavigationBarAppearance()
//      coloredAppearance.configureWithOpaqueBackground()
//      coloredAppearance.backgroundColor = .systemMint
//      coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//      UINavigationBar.appearance().standardAppearance = coloredAppearance
//      UINavigationBar.appearance().compactAppearance = coloredAppearance
//      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//
////      UINavigationBar.appearance().tintColor = .blue
//    }

//}

//struct SwiftUIToolbars: View {
//    @State var color = Color.red
//
//    var body: some View {
//struct SwiftUIToolbars: View {
//    @State var color = Color.red
//
//    var body: some View {
//        Text("Weird animal names").foregroundColor(color).toolbar
//        {
//            ItemsToolbar {
//                print("Spiny Lumpsucker")
//                color = Color.red
//            } sort: {
//                print("Tasselled Wobbegong")
//                color = Color.blue
//            } filter: {
//                print("Streaked Tenrec")
//                color = Color("DarkGreen")
//            }
//        }.navigationBarTitle("ToolBars", displayMode: .inline)
//    }
//}

struct SwiftUIToolbars_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToolbars()
    }
}
