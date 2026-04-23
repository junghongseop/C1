//
//  AwardRandomPieceController.swift
//  C1
//
//  Created by 정홍섭 on 4/23/26.
//

import SwiftData

func awardRandomPiece(
    context: ModelContext,
    allPieces: [PohangPiece]
) throws {
    let descriptor = FetchDescriptor<MapPieceState>()
    let savedStates = try context.fetch(descriptor)

    let stateMap = Dictionary(uniqueKeysWithValues: savedStates.map { ($0.pieceID, $0) })

    let availablePieces = allPieces.filter { piece in
        let currentCount = stateMap[piece.id]?.drawCount ?? 0
        return currentCount < 3
    }

    guard let selectedPiece = availablePieces.randomElement() else {
        return
    }

    if let existing = stateMap[selectedPiece.id] {
        existing.drawCount += 1
    } else {
        let newState = MapPieceState(pieceID: selectedPiece.id, drawCount: 1)
        context.insert(newState)
    }

    try context.save()
}
