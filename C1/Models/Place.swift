//
//  Place.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import Foundation

struct Place: Codable, Identifiable {
    var id: String { name }
    let name: String
    let level: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name, level, image
    }
}
