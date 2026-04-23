//
//  RecordListItem.swift
//  C1
//
//  Created by 정홍섭 on 4/22/26.
//

import SwiftUI

struct RecordListItem: View {
    let record: Record
    let onTapPlay: () -> Void
    
    var thumnailImage: UIImage? {
        guard let data = record.imageData.first else { return nil }
        return UIImage(data: data)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let image = thumnailImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 131)
                    .clipped()
                    .background(.black)
                    .blur(radius: 4, opaque: false)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .fill(.ultraThinMaterial.opacity(0.4))
                            .blur(radius: 5)
                            .frame(height: 100)
                            .allowsHitTesting(false)
                    }
            }
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(record.place)
                        .font(.system(size: 26))
                        .bold()
                        .foregroundStyle(.white)
                    Text(record.activityDate.formatted(
                        .dateTime
                            .year()
                            .month()
                            .day()
                            .locale(Locale(identifier: "ko_KR"))
                    )
                    )
                    .font(.system(size: 18))
                    .bold()
                    .foregroundStyle(.white)
                }
                
                Spacer()
                
                Image(systemName: "play.fill")
                    .foregroundStyle(.white)
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .background(.regularMaterial)
                    .clipShape(Circle())
            }
            .padding(12)
        }
        .cornerRadius(18)
        .onTapGesture {
            onTapPlay()
        }
    }
}

#Preview {
    RecordListItem(
        record: Record(place: "C5", activityDate: Date()),
        onTapPlay: {}
    )
}
