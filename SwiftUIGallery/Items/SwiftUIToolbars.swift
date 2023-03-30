
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

        ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
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

//Views have toolbar modifier, which doesn't so much create a toolbar
//but adds items in the toolbar. So I can have two Text items, each with
//their own .toolbars iwth an image each, and the top bar will

struct SwiftUIToolbars: View {
    @State var color = Color.red
    var placement : ToolbarItemPlacement
    var idString: String
    
    init(idString: String, placement: ToolbarItemPlacement){
        self.placement = placement
        self.idString = idString
    }
    
    var body: some View{
        
        toolbarView(idString:idString, placement: placement)
    }
    
    func toolbarView(idString: String, placement:ToolbarItemPlacement) -> AnyView{
                    
            switch idString{
            case "simpleTextBar":
                return AnyView(simpleTextBar())
                
            case "simpleTextImageBar":
                return AnyView(simpleTextImageBar())
                
            case "multiple":
                return AnyView(multipleToolbars())
                
            case "titlemenu":
                return AnyView(toolBarTitleWithMenu())
                
            case "datepicker":
                return AnyView(titleDatePickerMenuExample(placement: placement))
                
            case "compoundobject":
                return AnyView(toolbarItemGroupView(placement: placement))
              
            case "bottombar2":
                return AnyView(bottomToolBarSimple2(placement: placement))

            case "toolbarwithlink":
                return AnyView(topToolBarWithLink())
           
                
            case "customizable":
                return AnyView(customizableToolBar())
                
            default:
                return AnyView(Text("Default"))
            }
        }
}

struct simpleTextBar: View{
    
    var body: some View{
        NavigationStack{
            Text("My First Toolbar").toolbar{
                ToolbarItem{
                    Button(action: {print("Hit Button")}) {
                        Text("Press Here")
                    }
                }
            }
        }
    }
}

struct simpleTextImageBar: View{
    
    var body: some View {
        NavigationStack {
            Text("Cat goes here").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "sunrise.circle")
                    }
                }
        }
    }
}


struct multipleToolbars: View {
    
    var body: some View {
        NavigationStack {
            Text("Globe").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "globe.americas.fill")
                    }
                }
            Text("Plane").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "airplane")
                    }
                    ToolbarItem{
                        searchView(text: "Plane")
                    }
                }
        }
    }
}
struct toolBarTitleWithMenu: View{
    
    var body: some View {
        NavigationStack {
            Text("Ellie").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarTitleMenu{
                        Button(action: {print("Apollo 11")}){
                            Text("Apollo 11")
                            Image("Apollo 11")
                        }
                        Button(action: {print("Apollo 12")}){
                            Text("Apollo 12")
                            Image("Apollo 12")
                        }
                        Button(action: {print("Apollo 14")}){
                            Text("Apollo 14")
                            Image("Apollo 14")
                        }

                        Button(action: {print("Apollo 15")}){
                            Text("Apollo 15")
                            Image("Apollo 15")
                        }
                        Button(action: {print("Apollo 16")}){
                            Text("Apollo 16")
                            Image("Apollo 16")
                        }
                        Button(action: {print("SpiderPig")}){
                            Text("Spider Pig")
                            Image("SpiderPig")
                        }
                    }
                }
                .navigationTitle("Lunar Landings")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct toolbarItemGroupView: View{
    @State private var text = "Go Amiga!"
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 25.0
    var placement : ToolbarItemPlacement
    
    init(placement: ToolbarItemPlacement){
        self.placement = placement
    }
    
    var displayFont: Font {
        let font = Font.system(size: CGFloat(fontSize),
                               weight: bold == true ? .bold : .regular)
        return italic == true ? font.italic() : font
    }
    
    var body: some View {
        NavigationStack{
                Spacer()
            
                TextEditor(text: $text)
                    .font(displayFont)
                    .navigationTitle("My Note").foregroundColor(.red).font(.title)
                    .multilineTextAlignment(.center)
                    .toolbar {
                        ToolbarItemGroup(placement: placement)
                        {

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
                            
                        Spacer()
                            
                    }
            }
        }
    }
}

//from swiftwithmajid

struct titleDatePickerMenuExample: View {
    @State private var date = Date.now
    @State private var datePickerShown = false
    var placement: ToolbarItemPlacement
    
    init(placement: ToolbarItemPlacement)
    {
        self.placement=placement
    }
    
    var body: some View {
        NavigationStack {
            Text("(Courtesy of swiftwithmajid)")
            
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
struct toolBarWithImagesLink: View {
    var body: some View{
        NavigationStack {
            VStack {
                NavigationLink {
                    Text("Don't Click Here!").fontWeight(.medium).font(.system(size: 35.0)).foregroundColor(.red)
                } label: {
                    Text("Click here").fontWeight(.medium).font(.system(size: 35.0)).toolbar {
                        Button(action: {print("hit button 1")}) {
                            Image(systemName: "mic.circle")
                        }.fontWeight(.medium).font(.system(size: 20))

                        Button(action: {print("hit button 2")}) {
                            Image(systemName: "person.crop.circle")
                        }.fontWeight(.medium).font(.system(size: 20))
                    }
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

struct bottomToolBarSimple2: View {
    
    var placement: ToolbarItemPlacement
    
    init(placement: ToolbarItemPlacement) {
        self.placement = placement
    }
    var body: some View {
        NavigationStack {
            Text("My app")
                .toolbar {
                    ToolbarItemGroup(placement: placement) {
                        
                        Divider()
                        
                        Image(systemName: "moon.stars")
                        HStack {
                            Image(systemName: "ellipsis")
                            Divider()
                            
                            Button(action: {print("Apollo 13")}){
                                Text("Click here")
                            }
                            
                            Button(action: {print("Apollo 13")}){
                                Image("Apollo 13")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 32, height: 32)
                                    .background(Color.white)
                                    .mask(Circle())
 
                            }
                        }
                    }
                }
        }
    }
}

struct bottomToolBarSimple: View {
    var body: some View {
        NavigationStack{ //NavigationStack
            Text("Content")
            
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("Hello") {
                            print("Hello world!")
                        }
                        
                        Button(action: {print("hit Marge")}){
                            Text("Marge")
                            Image("Marge")
                        }
                        
                        Button("World") {
                            Image("Homer")
                            print("Hello world!")
                        }
                    }
                }
        }
    }
}

struct topToolBarWithLink: View {
    var body: some View{
        NavigationStack {
            VStack {
                NavigationLink {
                    Text("Don't click here").fontWeight(.medium).font(.system(size: 35.0)).foregroundColor(.red)
                } label: {
                    Text("Click here").fontWeight(.medium).font(.system(size: 35.0))
                }
            }
            .toolbar {
                
                NavigationLink {
                    Text("Don't click here")
                } label: {
                    Text("Click here")
                }
            }
            .navigationBarTitleDisplayMode(.inline) //centered title. Use ".large" for a side title
            .navigationTitle("Home")
            .padding()
        }
    }
}



struct customizableToolBar: View {
    
    var body: some View {
        NavigationStack {
            Text("Overflow menu on iPhone, customizable on iPad")
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

struct simpleToolbar2: View {
    var text: String
    
    var body: some View {
        NavigationStack {
            Text("Higgs").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "sunrise.circle")
                    }
                }
            Text("Ellie").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItem {
                        Image(systemName: "airplane")
                    }
                    ToolbarItem{
                        searchView(text: "Search Me")
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
        NavigationStack {
            Text("My app").fontWeight(.light).font(.system(size: 40))
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Image(systemName: "person")
                        Divider()
                        Image(systemName: "ellipsis")
                        Spacer()
                        Image(systemName: "trash")
                        Spacer()
                    }
                }
        }
    }
}

struct bottomSimpleToolbar3: View {
    var text: String
    
    var body: some View {
        NavigationStack {
            Text("My app")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.pink)
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

struct SwiftUIToolbars_Previews: PreviewProvider {

    static var previews: some View {
        
        SwiftUIToolbars(idString: "toolbarwithlink", placement: ToolbarItemPlacement.bottomBar)
    }
}

