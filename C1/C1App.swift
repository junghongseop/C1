//
//  C1App.swift
//  C1
//
//  Created by 정홍섭 on 3/27/26.
//

import SwiftUI
import SwiftData

@main
struct C1App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Bookmark.self, Record.self, MapPieceState.self])
    }
}

