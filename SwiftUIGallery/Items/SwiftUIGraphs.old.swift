//
//  SwiftUIGraphs.swift
//  SwiftUIGallery
//
//  Created by mike on 8/2/22.
//

import Foundation
import SwiftUI

struct GraphType:Identifiable{
    let id = UUID()
    let title: String
}

//extension ChartType{
//    static var charts: [ChartType] {
//        [
//            ChartType(title: "Bar"),
//            ChartType(title: "Pie"),
//            ChartType(title: "Stacked Column"),
//            ChartType(title: "Column"),
//            ChartType(title: "Line"),
//            ChartType(title: "Scatter"),
//            ChartType(title: "Spiral"),
//            ChartType(title: "Waterfall"),
//        ]
//    }
//}

let _graphTypes = [

    GraphType(title: "Bar"),
    GraphType(title: "Pie"),
    GraphType(title: "Stacked Column"),
    GraphType(title: "Column"),
    GraphType(title: "Line"),
    GraphType(title: "Scatter"),
    GraphType(title: "Spiral")
    
]

struct customGraphMenuItem : View
{
    static func == (lhs: customGraphMenuItem, rhs: customGraphMenuItem) -> Bool {
        false           //just to keep the compiler happy
    }
    
    var title : String
    var imageName: String = "fillMeIn"
    var color = Color.gray
    var description : String = "Put long winded description here"
    var navTarget: AnyView?
    var children: [customGraphMenuItem]?=nil
    
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

extension customGraphMenuItem: Identifiable {
    // assuming `name` is unique, it can be used as our identifier
    var id: String { title }
    
}

struct _customGraphMenu
{
    var customGraphMenuList: [customGraphMenuItem] = []

    let graphs=_graphTypes
//    var months: [Month]
    
    init()
    {
        for graphType in _graphTypes
        {
            let navTarget = AnyView(SwiftUIDatePicker())
            var menuItem = customGraphMenuItem( title: graphType.title, navTarget: navTarget)
            
            menuItem.description=graphType.title
            customGraphMenuList.append(menuItem)
            
//            print("Month: \(sale)")
        }
    }
}

//init()
//let flsales = FirstLightSales().sales

//{//save for list handling later
//    months = flsales!.months
//    for sale in months
//    {
////            var menuItem = customGraphMenuItem( title: graphType.name,  imageName: ,color: Color.green,  navTarget: AnyView(MissionCard(mission: mission)))
//        menuItem.description=mission.missionDescription
//
//        customGraphMenuList.append(menuItem)
//
//        print("Month: \(sale)")
//    }
//}

struct SwiftUICharts: View
{
    let customMenuList = _customGraphMenu().customGraphMenuList
    let flsales = FirstLightSales().sales
    
    var body: some View
    {
        List(customMenuList, children: \.children) { item in

            if item.children == nil {
                navCustGraphItemView(customGraphMenuItem: item)
            }
            else{
                item.onTapGesture {
                    print("Show details for user")
                }
            }
        }.navigationBarTitle("Lists", displayMode: .inline)
    }
}

struct navCustGraphItemView : View
{
    var customGraphMenuItem: customGraphMenuItem
    
    var link: NavigationLink<AnyView,AnyView>
    
    init(customGraphMenuItem: customGraphMenuItem){
        self.customGraphMenuItem=customGraphMenuItem
        
        link=NavigationLink(
            destination: customGraphMenuItem.navTarget ?? AnyView(SwiftUIDatePicker()),
            label: {AnyView(customGraphMenuItem)}
        )
    }
    
    var body: some View
    {
        link
    }
}

struct SwiftUIGraphs_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUIGraphs()
        }
    }
}
