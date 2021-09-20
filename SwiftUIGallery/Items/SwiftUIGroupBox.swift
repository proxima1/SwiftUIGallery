//
//  SwiftUIGroupBox.swift
//  SwiftUIGallery
//
//  Created by mike on 9/3/21.
//

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
