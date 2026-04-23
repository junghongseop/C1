//
//  Record.swift
//  C1
//
//  Created by 정홍섭 on 4/22/26.
//

import Foundation
import SwiftData

@Model
class Record {
    @Attribute(.unique) var id: UUID
    @Attribute(.externalStorage) var imageData: [Data]
    
    var place: String
    var activityDate: Date
    
    init(id: UUID = UUID(), imageData: [Data] = [], place: String, activityDate: Date) {
        self.id = id
        self.imageData = imageData
        self.place = place
        self.activityDate = activityDate
    }
}
