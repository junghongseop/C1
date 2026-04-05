//
//  SparkleStarView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct SparkleStarView: View {
    @State private var isAnimating: Bool = false
    
    let marker: Marker
    
    init(marker: Marker) {
        self.marker = marker
    }
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: CGFloat.random(in: 2...4))
            .scaleEffect(isAnimating ? 1.2 : 0.8)
            .opacity(isAnimating ? 1.0 : 0.3)
            .animation(
                .easeInOut(duration: Double.random(in: 1.5...3.0))
                .repeatForever(autoreverses: true)
                .delay(Double.random(in: 0...2)),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
            .position(x: marker.x, y: marker.y)
    }
}

#Preview {
    SparkleStarView(marker: Marker(x: 100, y: 200)).background(.black)
}
