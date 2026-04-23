//
//  OnboardingView.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.background.opacity(0.2))
            
            Text("""
            포항에서의 여름을
            더 특별하게 즐겨보세요
            
            장소를 추천받고
            활동을 인증해 지도를 채워보세요
            """)
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .font(.system(size: 20))
        }
    }
}

#Preview {
    OnboardingView()
}
