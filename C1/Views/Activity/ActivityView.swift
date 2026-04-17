//
//  ActivityView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI
import PhotosUI

struct ActivityView: View {
    @FocusState var isFocused: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @State var loadedImages: [UIImage] = []
    @State var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(alignment: .leading, spacing: 30) {
                    ActivityPhotoPicker()
                    
                    LocationInput(isFocused: $isFocused)
                    
                    ActivityDatePicker()
                    
                    Spacer()
                    
                    Button("작성 완료") {}
                        .buttonStyle(PrimaryButtonStyle())
                        .disabled(loadedImages.isEmpty)
                    
                }
                .padding(.horizontal, 23)
                .padding(.vertical, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .glassEffect(.clear, in: .rect(cornerRadius: 38))
                .padding(.horizontal, 17)
                .padding(.bottom, -17)
            }
            .onTapGesture {
                isFocused = false
            }
        }
    }
}

#Preview {
    ActivityView()
}
