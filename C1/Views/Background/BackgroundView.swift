//
//  BackgroundView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct BackgroundView: View {
    let stars: [Marker] = [
        Marker(x: 35, y: 75),
        Marker(x: 70, y: 160),
        Marker(x: 310, y: 80),
        Marker(x: 270, y: 135),
        Marker(x: 110, y: 100)
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                // MARK: Background Gradient
                VStack(spacing: 0) {
                    SkyGradientLayer(heightSize: geo.size.height * 0.55)
                    SeaGradientLayer(heightSize: geo.size.height * 0.45)
                }
                
                // MARK: Moon and MoonReflection
                VStack(spacing: 0) {
                    Color.clear.frame(height: geo.size.height * 0.05)
                    
                    MoonView()
                    
                    Color.clear.frame(height: geo.size.height * 0.41)
                    
                    MoonReflectionView()
                }
                .padding(.top, 40)
                
                // MARK: Stars
                ForEach(stars, id: \.self) { star in
                    SparkleStarView(marker: star)
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
