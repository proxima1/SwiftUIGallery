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

struct missionStyle: ViewModifier
{
    func body(content: Content)->some View
    {
        return content
            //            .foregroundColor(.gray)
            .frame(width: 250, alignment:.leading)
    }
}

struct SwiftUIGroupBox: View {
    
    let allMissions = AllMissions().missions
    
    var body: some View {
        
        ScrollView{
            VStack(alignment:.center,spacing:-25){
                ForEach(allMissions!,id: \.id){mission in
                    groupBox(mission: mission)
                }
            }
        }
    }
}

struct groupBox: View{
    
    let mission: Mission
    
    var body: some View{
        GroupBox(label:Text(mission.name)){
            HStack{
                Image(mission.patch).resizable().frame(width:64,height:64,alignment:.center).shadow(color:.gray,radius:10,x: 5,y:5)
                Spacer()
                Divider()
                VStack(){
                    Text(mission.missionDescription).foregroundColor(.gray).modifier(missionStyle())
                    
                    Divider()
                    
                    Text(mission.crew).modifier(missionStyle())
                    Text(mission.date).modifier(missionStyle())
                }
            }
        }.navigationBarTitle("GroupBox", displayMode: .inline)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).cornerRadius(20).padding()
    }
}

struct SwiftUIGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIGroupBox()
    }
}
