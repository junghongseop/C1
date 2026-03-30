//
//  MoonView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI

struct MoonView: View {
    var body: some View {
        Circle()
            .frame(width: 80, height: 80)
            .foregroundStyle(Color("lemon"))
            .shadow(color: .white.opacity(0.9), radius: 40)
    }
}

#Preview {
    MoonView().background(.black).ignoresSafeArea()
}
