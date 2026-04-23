//
//  LocationSheetView.swift
//  C1
//
//  Created by 정홍섭 on 4/1/26.
//

import SwiftUI

struct LocationSheetView: View {
    let place: Place
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @Binding var navigationToActivity: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                Text(place.name)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                }
                .padding(9)
                .frame(width: 40, height: 40)
                .background(.white.opacity(0.7))
                .glassEffect(.clear)
                .clipShape(Circle())
            }
            
            Image(place.image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 240)
                .cornerRadius(12)
            
            Spacer()
            
            Button("활동 인증하러 가기") {
                dismiss()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    navigationToActivity = true
                }
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    LocationSheetView(
        place: Place(
            name: "C5", level: "1", image: "기청산식물원"),
            navigationToActivity: .constant(false)
        )
}
