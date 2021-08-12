//
//  SwiftUDatePicker.swift
//  SwiftUIGallery
//
//  Created by mike on 6/28/21.
//

import SwiftUI

//original: https://www.swiftcompiled.com/swiftui-datepicker/

struct SwiftUIDatePicker: View {
    @State private var randomDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State var date: Date = Date()
     
     var body: some View {
         VStack {
            Spacer()
             DatePicker("Date", selection: $date)
                 .datePickerStyle(CompactDatePickerStyle())
                .frame(height: 40)
            DatePicker("", selection: $date)
                 .datePickerStyle(WheelDatePickerStyle())
             DatePicker("Date Picker", selection: $date)
                 .datePickerStyle(GraphicalDatePickerStyle()).accentColor(.green)
             Spacer()
            Spacer()
         }
         .padding()
     }
}
   
struct SwiftUIDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDatePicker()
    }
}
