//
//  MissionCard.swift
//  SwiftUIGallery
//
//  Created by mike on 7/14/21.
//

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

struct LableValueView: View{
    
    var label: String
    var value: String
    
//    var mission: Mission = {
    
    var body: some View{
        HStack(){
            VStack(alignment:.leading){
                Text(label).fontWeight(.light)
            }
            VStack(alignment:.leading){
                Text(value).fontWeight(.bold)
            }
        }
    }
}
    
struct MissionCard_Previews: PreviewProvider {
    
//    var score = [
//        "Fry": 10,
//        "Leela": 29,
//        "Bender": 1,
//        "Zoidberg": 0
    
//    var mission: Mission = ["name": "Apollo 11",
//                   "crew": "Armstrong, Lovell, Aldrin",
//                   "patch": "Apollo 12",
//                   "description": "first lunar landing",
//                   "date": "July 16 to 24, 1969"
//                   ]
    
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
