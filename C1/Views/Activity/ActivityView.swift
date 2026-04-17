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
    
    @AppStorage("savedLocation") var savedLocation: String = ""
    @State var isLoading: Bool = false
    
    @State var loadedImages: [UIImage] = []
    @State var location: String = ""
    @State var selectedDate = Date()
        
    func saveData() {
        withAnimation { isLoading = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.savedLocation = self.location
            print("✅ AppStorage 저장 완료: \(self.savedLocation)")
            self.dismiss()
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(alignment: .leading, spacing: 30) {
                    ActivityPhotoPicker()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("장소명")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        TextField("장소를 입력해주세요.", text: $location)
                            .font(.callout)
                            .focused($isFocused)
                            .padding(12)
                            .frame(height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .inset(by: isFocused ? 0.5 : 0)
                                    .stroke(
                                        isFocused ? Color("mediumLightBlue") : Color.black,
                                        lineWidth: isFocused ? 2.5 : 1
                                    )
                            )
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("날짜")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                        
                        DatePicker(
                            "날짜 선택",
                            selection: $selectedDate,
                            in: ...Date(),
                            displayedComponents: [.date]
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .environment(\.locale, Locale(identifier: "ko_KR"))
                        .labelsHidden()
                        .tint(Color.mediumLightBlue)
                    }
                    
                    
                    Spacer()
                    
                    
                    Button(action: {
                        saveData()
                    }){
                        Text("작성 완료")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(location.isEmpty || loadedImages.isEmpty ? Color("mediumLightBlue").opacity(0.5) : Color("mediumLightBlue"))
                            .foregroundStyle(location.isEmpty || loadedImages.isEmpty ? .white.opacity(0.5) : .white)
                            .cornerRadius(14)
                            .fontWeight(.bold)
                    }
                    .disabled(location.isEmpty || loadedImages.isEmpty)
                    
                }
                .padding(.horizontal, 23)
                .blur(radius: isLoading ? 3 : 0)
                .padding(.vertical, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .glassEffect(.clear, in: .rect(cornerRadius: 38))
                .padding(.horizontal, 17)
                .padding(.bottom, -17)
                
                if isLoading {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                        
                        VStack(alignment: .center, spacing: 50) {
                            ProgressView()
                                .scaleEffect(1.5)
                                .tint(.white)
                            
                            Text("포항의 여름 추억을 저장하고 있어요...")
                                .font(.caption)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity)
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    ActivityView()
}
