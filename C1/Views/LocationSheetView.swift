//
//  LocationSheetView.swift
//  C1
//
//  Created by 정홍섭 on 4/1/26.
//

import SwiftUI

struct LocationSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @Binding var navigationToActivity: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("포항공과대학교 C5")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.gray)
            }
            
            Image("C5")
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
            
            HStack {
                Text("추천")
                    .bold()
                
                ForEach(0...4, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
            
            Spacer()
            
            Button {
                dismiss()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    navigationToActivity = true
                }
            } label: {
                Text("활동 인증하러 가기")
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("mediumLightBlue"))
                    .foregroundStyle(.white)
                    .cornerRadius(14)
                    .fontWeight(.bold)
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 20)
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    LocationSheetView(navigationToActivity: .constant(false))
}
