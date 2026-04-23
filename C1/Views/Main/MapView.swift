//
//  MapView.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI
import SwiftData

struct MapView: View {
    @Query var records: [Record]
    @Query var pieceStates: [MapPieceState]
    
    func opacity(for drawCount: Int) -> Double {
        switch drawCount {
        case 1: return 0.3
        case 2: return 0.6
        case 3...: return 1.0
        default: return 0.0
        }
    }
    
    var body: some View {
        let pieceStateMap = Dictionary(
            uniqueKeysWithValues: pieceStates.map { ($0.pieceID, $0.drawCount) }
        )
        
        ZStack(alignment: .center) {
            Image("line")
                .resizable()
                .scaledToFit()
                .frame(width: 372, height: 312)
                .padding(.horizontal, 15)
                .blur(radius: 2)
            
            Rectangle()
                .foregroundStyle(.background.opacity(0.2))
            
            if records.isEmpty {
                Text("활동을 인증하고 지도를 채워보세요")
                    .foregroundStyle(.white)
                    .font(.system(size: 18))
            } else {
                Image("lineFill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 372, height: 312)
                    .padding(.horizontal, 15)
                    .overlay {
                        ForEach(pohangPieces) { piece in
                            let drawCount = pieceStateMap[piece.id] ?? 0
                            
                            if drawCount > 0 {
                                Image(piece.imageName)
                                    .resizable()
                                    .frame(width: piece.width, height: piece.height)
                                    .position(x: piece.x, y: piece.y)
                                    .opacity(opacity(for: drawCount))
                            }
                        }
                    }
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MapView()
        .background(.black)
}
