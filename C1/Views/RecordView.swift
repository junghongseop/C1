//
//  RecordView.swift
//  C1
//
//  Created by 정홍섭 on 4/21/26.
//

import SwiftUI
import SwiftData

struct RecordView: View {
    @Query var records: [Record]
    
    @State var selectedRecord: Record?
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.background.opacity(0.2))
            
            VStack(spacing: 12) {
                HStack {
                    Text("인증 기록")
                        .padding(.horizontal, 15)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                
                
                if records.isEmpty {
                    VStack {
                        Spacer()
                        
                        Text("아직 등록된 인증 기록이 없어요\n장소를 추가하고 활동을 시작해보세요")
                            .font(.system(size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 15)
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(records) { record in
                            RecordListItem(record: record) {
                                selectedRecord = record
                            }
                        }
                    }
                }
                .padding(.horizontal, 15)
                .scrollIndicators(.hidden)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            .navigationDestination(item: $selectedRecord) { record in
                RecordStoryView(record: record) {
                    selectedRecord = nil
                }
            }
        }
    }
}

#Preview {
    RecordView()
}
