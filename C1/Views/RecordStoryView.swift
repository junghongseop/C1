//
//  RecordStoryView.swift
//  C1
//
//  Created by 정홍섭 on 4/23/26.
//

import SwiftUI
import Combine

struct RecordStoryView: View {
    let record: Record
    let onClose: () -> Void
    
    @State var currentIndex: Int = 0
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var images: [UIImage] {
        record.imageData.compactMap { UIImage(data: $0) }
    }
    
    func next() {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        } else {
            onClose()
        }
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            
            if images.indices.contains(currentIndex) {
                Image(uiImage: images[currentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.75), value: currentIndex)
        .onReceive(timer) { _ in
            next()
        }
    }
}

#Preview {
    let dummyImages: [Data] = [
        UIImage(systemName: "square.fill")?
            .withTintColor(.black, renderingMode: .alwaysOriginal),
        UIImage(systemName: "square.fill")?
            .withTintColor(.red, renderingMode: .alwaysOriginal),
    ]
        .compactMap { $0 }
        .compactMap { $0.jpegData(compressionQuality: 1.0) }
    
    var record = Record(place: "C5", activityDate: Date())
    record.imageData = dummyImages
    
    return RecordStoryView(record: record, onClose: {})
}
