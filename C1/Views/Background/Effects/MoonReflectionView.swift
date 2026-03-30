//
//  MoonReflectionView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct MoonReflectionView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("lemon").opacity(0.3), Color("lemon").opacity(0.5)]), startPoint: .top, endPoint: .bottom).frame(width: 150, height: 150).blur(radius: 75)
    }
}

#Preview {
    MoonReflectionView()
}
