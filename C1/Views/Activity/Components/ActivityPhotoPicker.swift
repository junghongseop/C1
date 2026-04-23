//
//  ActivityPhotoPicker.swift
//  C1
//
//  Created by 정홍섭 on 4/16/26.
//

import SwiftUI
import PhotosUI

struct SelectedPhoto: Identifiable {
    let id = UUID()
    let item: PhotosPickerItem
    var image: UIImage?
}

struct ActivityPhotoPicker: View {
    @Binding var selectedImageDataList: [Data]

    @State private var photos: [SelectedPhoto] = []
    @State private var selectedItems: [PhotosPickerItem] = []

    @State private var contentWidth: CGFloat = 0
    @State private var scrollWidth: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("인증 사진")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    PhotosPicker(
                        selection: $selectedItems,
                        maxSelectionCount: 10,
                        matching: .images
                    ) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 1.5,
                                    lineCap: .round,
                                    dash: [5, 5]
                                )
                            )
                            .foregroundStyle(.white)
                            .background(.clear)
                            .frame(width: 80, height: 80)
                            .overlay {
                                VStack(alignment: .center, spacing: 6) {
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)

                                    Text("\(photos.count)/10")
                                        .font(.system(size: 17))
                                        .foregroundStyle(.white)
                                }
                                .padding(14)
                            }
                    }
                    .disabled(photos.count == 10)

                    ForEach(Array(photos.enumerated()), id: \.element.id) { index, photo in
                        if let image = photo.image {
                            ZStack(alignment: .topTrailing) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                Button {
                                    removePhoto(at: index)
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.black)
                                        .clipShape(Circle())
                                        .padding(-8)
                                }
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
                            .onChange(of: proxy.size.width) { _, newValue in
                                contentWidth = newValue
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
                        .onChange(of: proxy.size.width) { _, newValue in
                            scrollWidth = newValue
                        }
                }
            )
            .scrollDisabled(contentWidth <= scrollWidth)
            .onChange(of: selectedItems) { _, newItems in
                loadSelectedItems(newItems)
            }
        }
    }

    private func removePhoto(at index: Int) {
        guard photos.indices.contains(index),
              selectedItems.indices.contains(index),
              selectedImageDataList.indices.contains(index) else { return }

        photos.remove(at: index)
        selectedItems.remove(at: index)
        selectedImageDataList.remove(at: index)
    }

    private func loadSelectedItems(_ items: [PhotosPickerItem]) {
        photos = items.map { SelectedPhoto(item: $0, image: nil) }
        selectedImageDataList = Array(repeating: Data(), count: items.count)

        for i in items.indices {
            items[i].loadTransferable(type: Data.self) { result in
                if case .success(let data) = result,
                   let data,
                   let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if photos.indices.contains(i) {
                            photos[i].image = uiImage
                        }
                        if selectedImageDataList.indices.contains(i) {
                            selectedImageDataList[i] = data
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    ActivityPhotoPicker(selectedImageDataList: .constant([]))
        .padding()
        .background(.black)
        .ignoresSafeArea()
}
