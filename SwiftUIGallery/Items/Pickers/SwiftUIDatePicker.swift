//
//  SwiftUDatePicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

struct SwiftUIDatePicker: View {
    @State private var randomDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
     var body: some View {
         VStack {
            Spacer()
            
            HStack{
             DatePicker(selection: $randomDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date").bold()
             }.frame(minWidth: 150.0, idealWidth: 200.0, maxWidth: 250.0, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100.0, maxHeight: 100.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).datePickerStyle(WheelDatePickerStyle())

            }
            
            Spacer()
            
            Text("Date is \(randomDate, formatter: dateFormatter)")
            Spacer()
            
         }
     }
}
   
struct SwiftUIDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDatePicker()
    }
}
