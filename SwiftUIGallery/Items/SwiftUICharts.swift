//
//  SwiftUICharts.swift
//  SwiftUIGallery
//
//  Created by mike on 8/2/22.
//

import Foundation
import SwiftUI
import Charts

//real basic example


struct HorBarChartExample: View {
    
    @State var months = FirstLightSales().sales?.months
    
    var body: some View {
        Chart{
            
            ForEach(months!){
                BarMark(
                    x: .value("Month", $0.monthAbbr),
                    y: .value("Sales", Int($0.product[0].total) ?? 0)
                ).foregroundStyle(Color.purple)
            }
        }.chartYScale(range: 0...150).padding(20.0).frame(width:400, height:200)
    }
}

struct LineChartExample: View {
    
    @State var months = FirstLightSales().sales?.months
    
    var body: some View {
        Chart{
            
            ForEach(months!){
                    LineMark(
                        x: .value("Month", $0.monthAbbr),
                        y: .value("Sales", Int($0.product[0].total) ?? 0)
                    ).foregroundStyle(Color.blue)
            }
        }//.chartYScale(range: 0...150).padding(20.0).frame(width:400, height:200)
    }
}


struct ScatterChartExample: View {
    
    @State var months = FirstLightSales().sales?.months
    
    var body: some View {
        Chart{
            
            ForEach(months!){
                    PointMark(
                        x: .value("Month", $0.monthAbbr),
                        y: .value("Sales", Int($0.product[0].total) ?? 0)
                    ).foregroundStyle(Color.blue)
            }
        }//.chartYScale(range: 0...150).padding(20.0).frame(width:400, height:200)
    }
}

//Chart(allSeasonProducts) {
//     PointMark(
//       x: .value("Category", $0.category),
//       y: .value("Number of sell", $0.numberOfSell)
//  )
//  .foregroundStyle(by:

struct SwiftUICharts: View
{
    let flsales = FirstLightSales().sales
    
    var body: some View
    {
        VStack{
            Spacer()
            Text(verbatim:"Charts are broad and deep, so this is a basic example. Consult a dedicated chart-gallery for deeper content").fontWeight(.light).font(.system(size: 15.0)) .padding(EdgeInsets(top:40, leading:20.0, bottom:0.0, trailing:10.0))
            List{
                HorBarChartExample()
                Spacer()
                LineChartExample()
                Spacer()
                AppleBarChart()
                Spacer()
                ScatterChartExample()
                Spacer()
                Spacer()
            }
        }
    }
}

struct SwiftUICharts_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUICharts()
        }
    }
}

//Apple's example goes here

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 8),
    .init(type: "Pyramid", count: 4)
]

//

struct AppleBarChart: View {
    var body: some View {
        Chart {
            BarMark(
                   x: .value("Shape Type", data[0].type),
                   y: .value("Total Count", data[0].count)
               )
               BarMark(
                    x: .value("Shape Type", data[1].type),
                    y: .value("Total Count", data[1].count)
               )
               BarMark(
                    x: .value("Shape Type", data[2].type),
                    y: .value("Total Count", data[2].count)
               )
        } .foregroundStyle(
            .linearGradient(
                colors: [.cyan, .green],
                startPoint: .bottom,
                endPoint: .top
            )
        )
    }
}
