//
//  BookmarkController.swift
//  C1
//
//  Created by 정홍섭 on 4/22/26.
//

import SwiftData

func toggleBookmark(
    place: Place,
    context: ModelContext,
    bookmarks: [Bookmark]
) -> Bool {
    
    if let target = bookmarks.first(where: { $0.name == place.name }) {
        context.delete(target)
        print(target)
        return false
    } else {
        let newBookmark = Bookmark(
            name: place.name,
            level: place.level,
            image: place.image
        )
        context.insert(newBookmark)
        print(newBookmark)
        return true
    }
}
