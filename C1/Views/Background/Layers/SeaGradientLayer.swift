//
//  SeaGradientLayer.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct SeaGradientLayer: View {
    var heightSize: Double
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("darkSora"), Color("darkBlue"), Color("indigo")]), startPoint: .top, endPoint: .bottom)
            .frame(height: heightSize)
    }
}

#Preview {
    SeaGradientLayer(heightSize: .infinity)
}
