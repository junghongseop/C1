//
//  ActivityPhotoPicker.swift
//  C1
//
//  Created by 정홍섭 on 4/16/26.
//

import SwiftUI
import PhotosUI

struct ActivityPhotoPicker: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var loadedImages: [UIImage] = []
    
    @State var contentWidth: CGFloat = 0
    @State var scrollWidth: CGFloat = 0
    
    func loadTransferableImages() {
        loadedImages.removeAll()
        
        for item in selectedItems {
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case.success(let data):
                    if let data = data, let uiImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.loadedImages.append(uiImage)
                        }
                    }
                case .failure(let error):
                    print("이미지 로딩 에러: \(error)")
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("인증 사진")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    PhotosPicker (
                        selection: $selectedItems,
                        maxSelectionCount: 10,
                        matching: .images
                    ) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style:
                                        StrokeStyle(
                                            lineWidth: 1.5,
                                            lineCap: .round,
                                            dash: [5, 5]
                                        )
                            )
                            .foregroundStyle(.white)
                            .background(.clear)
                            .frame(width: 80, height: 80)
                            .overlay{
                                VStack(alignment: .center, spacing: 6) {
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                    Text("\(loadedImages.count)/10")
                                        .font(.system(size: 17))
                                        .foregroundStyle(.white)
                                }
                                .padding(14)
                            }
                    }.disabled(loadedImages.count == 10)
                    
                    ForEach(0..<loadedImages.count, id: \.self) { index in
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: loadedImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            Button(action: {
                                loadedImages.remove(at: index)
                                
                                if selectedItems.indices.contains(index) {
                                    selectedItems.remove(at: index)
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.black)
                                    .clipShape(Circle())
                                    .padding(-8)
                            }
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.bottom, 1)
                .padding(.leading, 1)
                .padding(.trailing, 8)
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                contentWidth = proxy.size.width
                            }
                            .onChange(of: proxy.size.width) {
                                contentWidth = proxy.size.width
                            }
                    }
                )
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            scrollWidth = proxy.size.width
                        }
                        .onChange(of: proxy.size.width) {
                            scrollWidth = proxy.size.width
                        }
                }
            )
            .scrollDisabled(contentWidth <= scrollWidth)
            .onChange(of: selectedItems) {
                loadTransferableImages()
            }
        }
    }
}


#Preview {
    ActivityPhotoPicker()
        .padding()
        .background(.black)
        .ignoresSafeArea()
}
