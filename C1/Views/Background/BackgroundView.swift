//
//  BackgroundView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct BackgroundView: View {
    let stars: [Marker] = [
        Marker(x: 35, y: 8),
        Marker(x: 70, y: 115),
        Marker(x: 310, y: 20)
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: Background Gradient
            GeometryReader { geo in
                VStack(spacing: 0) {
                    SkyGradientLayer(heightSize: geo.size.height * 0.55)
                    SeaGradientLayer(heightSize: geo.size.height * 0.45)
                }
            }
            .ignoresSafeArea()
            
            // MARK: Moon and MoonReflection
            GeometryReader { geo in
                VStack(spacing: 0) {
                    MoonView()
                    
                    Color.clear.frame(height: geo.size.height * 0.45)
                    
                    MoonReflectionView()
                }.padding(.top, 20)
            }
            
            // MARK: Stars
            ForEach(stars, id: \.self) { star in
                StarView(marker: star)
            }
            SparkleStarView(marker: Marker(x: 270, y: 75))
            SparkleStarView(marker: Marker(x: 110, y: 55))
        }
    }
}

#Preview {
    BackgroundView()
}
