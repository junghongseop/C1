//
//  StarView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct StarView: View {
    var marker: Marker
    
    var body: some View {
        Circle().fill(Color.white.opacity(0.6)).frame(width: 4, height: 4).position(x: marker.x, y: marker.y)
    }
}

#Preview {
    StarView(marker: Marker(x: 100, y: 150)).background(.black)
}
