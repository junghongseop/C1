//
//  SeaGradientLayer.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct SkyGradientLayer: View {
    var heightSize: Double

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("darkNavy"), Color("semiDarkNavy"), Color("sora")]), startPoint: .top, endPoint: .bottom)
            .frame(height: heightSize)
    }
}

#Preview {
    SkyGradientLayer(heightSize: .infinity)
}
