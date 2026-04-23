//
//  BookmarkView.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI
import SwiftData

struct BookmarkView: View {
    @Query var bookmarks: [Bookmark]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.background.opacity(0.2))
            
            VStack(spacing: 12) {
                HStack {
                    Text("즐겨찾기")
                        .padding(.horizontal, 15)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                
                
                if bookmarks.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("아직 즐겨찾기한 장소가 없어요\n지도에서 장소를 선택해 즐겨찾기에 추가해보세요")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 10)
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(bookmarks) { bookmark in
                            ListItem(place: Place (
                                name: bookmark.name, level: bookmark.level, image: bookmark.image
                            ))
                        }
                    }
                }
                .padding(.horizontal, 15)
                .scrollIndicators(.hidden)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    BookmarkView()
        .modelContainer(for: Bookmark.self)
}
