//
//  SwiftUIPicker.swift
//  SwiftUIGallery
//
//  Created by mike on 7/29/22.
//

import SwiftUI
import PhotosUI
import UIKit

struct SwiftUIPhotoPicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var selectedPhotos: [PhotosPickerItem] = []
    
    var body: some View {
        PhotosPicker(selection: $selectedPhotos) {
            VStack{
                Text("Choose photos").font(.largeTitle)
                Text("As of this writing, while using Beta 4 of the iOS frameworks, the photopicker is crashing when I try to get the selection of an image, so that part has been turned off.")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
            }
        }
//        .onChange(of: selectedItem) { newItem in
//
//            Task {
////                 Retrive selected asset in the form of Data
//                if let data = try? await newItem?.loadTransferable(type: Data.self) {
//                    selectedImageData = data
//                }
//            }
//        }
    }
}

struct SwiftUIPhotoPicker_Preview: PreviewProvider {
    static var previews: some View {
        SwiftUIPhotoPicker()
    }
}
