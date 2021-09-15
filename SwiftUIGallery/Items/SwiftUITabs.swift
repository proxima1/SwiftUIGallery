//
//  SwiftUTabs.swift
//  SwiftUIGallery
//
//  Created by mike on 9/14/21.
//

import SwiftUI

struct SwiftUITabs: View {
    var body: some View {
            TabView {
                SwiftUIDatePicker()
                    .tabItem {
                        Label("Date", systemImage: "calendar.badge.clock")
                    }

                SwiftUIGroupBox()
                    .tabItem {
                        Label("Missions", systemImage: "lasso.sparkles")
                    }
            }.navigationBarTitle("Tabs", displayMode: .inline)

        }
}

struct SwiftUITabs_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITabs()
    }
}
