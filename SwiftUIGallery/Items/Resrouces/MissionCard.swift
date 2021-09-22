//MissionCard: displays the mission summary info

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

struct MissionCard: View {
    
    let lineSpacing: CGFloat = 25.0
    let fontSize: CGFloat = 15.0
    var mission: Mission
    
    var body: some View {
        NavigationView {
            
            Form{
                Image(mission.patch).resizable().frame(width:96,height:96,alignment:.center)
                
                Section(header: Text("Details"))
                {
                    HStack(){
                        titleBlock(fontSize: fontSize, lineSpacing: lineSpacing)
                        contentBlock(fontSize: fontSize, lineSpacing: lineSpacing, mission: mission)
                    }.onAppear(perform: {
                                print("mission: \(mission)")
                    })
                }
                Section(header: Text("Crew"))
                {
                    HStack
                    {
                        Spacer()
                        Image(mission.crewpict).resizable().frame(width:256,height:192,alignment:.bottom).cornerRadius(12.0)
                        Spacer()
                    }
                }
                Section(header: Text("Gallery"))
                {
                    HStack
                    {
                        Spacer()
                            VStack{
                                Image(mission.bestpict).resizable().frame(width:256,height:256,alignment:.bottom).cornerRadius(12.0)
                                Text(mission.bestpictcaption)
                            }.onAppear(perform: {
                                print("mission: \(mission)")
                                
                            })
                        Spacer()
                    }
                }
            }.navigationTitle(mission.name)
        }
    }
}

struct contentBlock: View{
   
    var fontSize : CGFloat
    var lineSpacing: CGFloat
    var mission: Mission
    
    var body: some View{
        VStack(alignment: .leading){
            Text(verbatim: mission.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
            Text(verbatim: mission.date).fontWeight(.bold).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
            Text(verbatim: mission.crew).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
                        Text(verbatim: mission.missionDescription).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
        }
        .frame(minWidth:frame(minWidth: 100, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 300, minHeight: 50, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: .top) as? CGFloat)
    }
}
    
struct titleBlock: View{
    
    var fontSize : CGFloat
    var lineSpacing: CGFloat
    
    var body: some View{
        
        VStack(alignment: .trailing){
            Text("Mission: ").fontWeight(.light).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
            Text("Date: ").fontWeight(.light).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
            Text("Crew: ").fontWeight(.light).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
            Text("Description: ").fontWeight(.light).font(.system(size: fontSize))
            Spacer().frame(maxHeight: lineSpacing)
        }.frame(minWidth:frame(minWidth: 100, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 300, minHeight: 50, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 100, alignment: .top) as? CGFloat)
    }
}
    
struct MissionCard_Previews: PreviewProvider {
    static var mission: Mission =  Mission(name:"Apollo 11",
                                    patch:"Apollo 11",
                                    missionDescription: "first lunar landing",
                                    date:"July 16 to 24, 1969",
                                    crew: "Armstrong, Lovell, Aldrin",
                                    codeNames: "Eagle and Columbia",
                                    crewpict: "A11.CrewPict",
                                    bestpict: "A11",
                                    bestpictcaption:"This is the very first image taken from the surface of the moon.")
    
    static var previews: some View {
        MissionCard(mission: mission)
    }
}
