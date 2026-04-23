//
//  MainView.swift
//  C1
//
//  Created by 정홍섭 on 3/27/26.
//

import SwiftUI

struct MainView: View {
    @State var showingSheet: Bool = false
    @State private var appState = AppNavigationState()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                TabView(selection: $appState.selectedTab) {
                    MapView()
                        .tag(0)
                    
                    RecommandView()
                        .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .safeAreaInset(edge: .top) {
                HStack {
                    Spacer()
                    
                    Menu {
                        NavigationLink(destination: BookmarkView()) {
                            Label("즐겨찾기", systemImage: "star")
                        }
                        
                        NavigationLink(destination: RecordView()) {
                            Label("인증 기록", systemImage: "map")
                        }
                    } label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 44)
                    }
                    .background(.white.opacity(0.3))
                    .glassEffect(.clear, in: .circle)
                    .clipShape(Circle())
                    .padding(.trailing, 15)
                }
            }
        }
        .environment(appState)
    }
}

#Preview {
    MainView()
}
