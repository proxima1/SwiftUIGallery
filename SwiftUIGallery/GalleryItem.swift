//
//  GalleryItem.swift
//  SwiftUIGallery
//
//  Created by mike on 10/22/20.
//

import Foundation


struct GalleryItem: Hashable, Codable, Identifiable  {
	
	var id: Int			//needed for the Identifiable conformance
	var name : String
	var description : String
//	var catagory: ControlCategory
	
	
	enum ControlCategory: String, Codable, CaseIterable, Hashable{
		case bottonType = "buttonType"
		case sliderType = "sliderType"
		case listType = "listType"
	}
}
