//
//  ListItem.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI
import SwiftData

struct ListItem: View {
    let place: Place
    
    @Environment(\.modelContext) private var context
    @Query private var bookmarks: [Bookmark]
    
    @State private var isBookmarked = false
    @State private var showSheet = false
    @State private var navigationToActivity = false
    
    var body: some View {
        HStack(alignment: .top) {
            Image(place.image)
                .resizable()
                .frame( width: 133, height: 89)
                .scaledToFit()
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.system(size: 20))
                    .bold()
                    .lineLimit(1)
                
                Text("Lv. \(place.level)")
                    .font(.system(size: 14))
                    .bold()
            }
            
            Spacer()
            
            Button {
                isBookmarked = toggleBookmark(
                    place: place,
                    context: context,
                    bookmarks: bookmarks
                )
            } label: {
                Image(systemName: isBookmarked ? "star.fill" : "star")
                    .foregroundStyle(isBookmarked ? .yellow : .white)
            }
            .padding(5)
            .background(.white.opacity(0.2))
            .glassEffect(.clear)
            .clipShape(Circle())
        }
        .padding(9)
        .frame(maxWidth: .infinity, maxHeight: 107)
        .background(.white.opacity(0.5))
        .glassEffect(.clear, in: Rectangle())
        .cornerRadius(12)
        .onAppear {
            isBookmarked = bookmarks.contains {
                $0.name == place.name
            }
        }
        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            LocationSheetView(
                place: place,
                navigationToActivity: $navigationToActivity
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .navigationDestination(isPresented: $navigationToActivity) {
            ActivityView(place: place)
        }
    }
}

#Preview {
    ListItem(place: Place(name: "C5", level: "1", image: "C5"))
        .background(.black)
}
