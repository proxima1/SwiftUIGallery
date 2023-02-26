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
    @State var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Label("Select a photo", systemImage: "photo")
        }
        .tint(.green)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .onChange(of: selectedItem) { newItem in

            Task {
                //                 Retrive selected asset in the form of Data
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }

            }
        }

        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
        }
    }
}

struct SwiftUIPhotoPicker_Preview: PreviewProvider {
    static var previews: some View {
        SwiftUIPhotoPicker()
    }
}
