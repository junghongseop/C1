//
//  LocationInput.swift
//  C1
//
//  Created by 정홍섭 on 4/16/26.
//

import SwiftUI

struct LocationInput: View {
    var isFocused: FocusState<Bool>.Binding
    
    @Binding var location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("장소명")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            TextField("장소를 입력해주세요.", text: $location)
                .font(.callout)
                .focused(isFocused)
                .padding(12)
                .frame(height: 44)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: isFocused.wrappedValue ? 0.5 : 0)
                        .stroke(
                            isFocused.wrappedValue ? Color("mediumLightBlue") : Color.clear,
                            lineWidth: isFocused.wrappedValue ? 2 : 0
                        )
                )
        }
    }
}

#Preview {
    @FocusState var isFocused: Bool
    
    LocationInput(isFocused: $isFocused, location: .constant("ddd"))
}
