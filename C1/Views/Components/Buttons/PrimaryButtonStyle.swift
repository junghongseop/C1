//
//  PrimaryButtonStyle.swift
//  C1
//
//  Created by 정홍섭 on 4/17/26.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(isEnabled ? Color.accentColor : Color.blue.opacity(0.5))
            .foregroundStyle(isEnabled ? .white: .white.opacity(0.5))
            .cornerRadius(14)
            .fontWeight(.bold)
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
