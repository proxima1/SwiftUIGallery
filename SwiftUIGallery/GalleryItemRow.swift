//
//  GalleryItemRow.swift
//  SwiftUIGallery
//
//  Created by mike on 10/22/20.
//

import Foundation
import SwiftUI

struct GalleryItemRow: View{
	var galleryItem: GalleryItem
	
	var body: some View{
		HStack{
			Text(verbatim: galleryItem.name)
		}
	}
}
