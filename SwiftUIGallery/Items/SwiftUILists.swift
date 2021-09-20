//
//  SwiftUILists.swift
//  SwiftUIGallery
//
//  Created by mike on 10/23/20.
//

import SwiftUI

//use this for the differnt kinds of list and sublist handling

//from https://www.appcoda.com/learnswiftui/swiftui-expandable-list.html
//struct customMenuItem : View
//{
//    var title : String
//    var imageName: String
//    var color: Color
//
//    var navTarget: AnyView
//    var children: [customMenuItem]?=nil
//
//    init()
//    {
//
//    }
//
//    var body: some View
//    {
//        HStack
//        {
//            Image(systemName: imageName).foregroundColor(color)
//            Text(title).foregroundColor(color).font(.title)
//        }.frame(maxWidth: .infinity, alignment: .leading)
//        .contentShape(Rectangle())
//
//    }
//}
//
//extension customMenuItem: Identifiable {
//     // assuming `name` is unique, it can be used as our identifier
//     var id: String { title }
//}

struct customMenuItem : View
{
    static func == (lhs: customMenuItem, rhs: customMenuItem) -> Bool {
        false           //just to keep the compiler happy
    }
    
    var title : String
    var imageName: String
    var color = Color.gray
    var description : String = "Put long winded description here"
    var navTarget: AnyView
    var children: [customMenuItem]?=nil
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Image(imageName).resizable().frame(width:30,height:30,alignment:.leading)
                Text(title).foregroundColor(Color.green).font(.title)
            }.frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            
            Text(description).foregroundColor(.gray).font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension customMenuItem: Identifiable {
     // assuming `name` is unique, it can be used as our identifier
     var id: String { title }
}

struct _customMenu
{
    var customMenuList: [customMenuItem] = []
    let apolloPatches = ApolloPatches().apolloPatches

    let allMissions = AllMissions().missions

    init()
    {
        for mission in allMissions!
        {
            var menuItem = customMenuItem( title: mission.name,  imageName: mission.patch,color: Color.green,  navTarget: AnyView(MissionCard(mission: mission)))
            menuItem.description=mission.missionDescription

            customMenuList.append(menuItem)
        }
    }
}

struct SwiftUILists: View
{
    let customMenuList = _customMenu().customMenuList
    
    var body: some View
    {
        List(customMenuList, children: \.children) { item in

            if item.children == nil {
                navCustMenuItemView(menuItem: item)
            }
            else{
                item.onTapGesture {
                    print("Show details for user")
                }
            }
        }.navigationBarTitle("Lists", displayMode: .inline)
    }
}

struct navCustMenuItemView : View
{
    var custMenuItem: customMenuItem
    
    var link: NavigationLink<AnyView,AnyView>
    
    init(menuItem: customMenuItem){
        self.custMenuItem=menuItem
        
        link=NavigationLink(
          destination: menuItem.navTarget,
          label: {AnyView(menuItem)}
          )
    }
    
    var body: some View
    {
        link
    }
}

struct SwiftUILists_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUILists()
        }
    }
}
