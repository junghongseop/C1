//
//  RecommandView.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI

struct RecommandView: View {
    let places: [Place] = load("places.json")
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.background.opacity(0.2))
            
            VStack(spacing: 12) {
                HStack {
                    Text("추천 장소")
                        .padding(.horizontal, 15)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(places) { place in
                            ListItem(place: place)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .scrollIndicators(.hidden)
            }
            .padding(.bottom, 50)
            .padding(.top, 100)
        }
    }
}

#Preview {
    RecommandView()
        .background(.black)
}
