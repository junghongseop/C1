//
//  Bookmark.swift
//  C1
//
//  Created by 정홍섭 on 4/22/26.
//

import Foundation
import SwiftData

@Model
class Bookmark {
    var name: String
    var level: String
    var image: String
    
    init(name: String, level: String, image: String) {
        self.name = name
        self.level = level
        self.image = image
    }
}
