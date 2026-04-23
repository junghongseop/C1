//
//  MapPieceState.swift
//  C1
//
//  Created by 정홍섭 on 4/23/26.
//

import Foundation
import SwiftData

@Model
final class MapPieceState {
    @Attribute(.unique) var pieceID: String
    var drawCount: Int

    init(pieceID: String, drawCount: Int = 0) {
        self.pieceID = pieceID
        self.drawCount = drawCount
    }
}
