//
//  ActivityView.swift
//  C1
//
//  Created by 정홍섭 on 3/30/26.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ActivityView: View {
    let place: Place
    
    @FocusState var isFocused: Bool
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Environment(AppNavigationState.self) private var appState
    
    @State var selectedImageDataList: [Data] = []
    @State var selectedDate = Date()
    @State var location: String
    
    init(place: Place) {
        self.place = place
        _location = State(initialValue: place.name)
    }
    
    private var isSubmitDisabled: Bool {
        selectedImageDataList.isEmpty || location.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func saveActivity() {
        let trimmedLocation = location.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let record = Record(imageData: selectedImageDataList, place: trimmedLocation, activityDate: selectedDate)
        
        context.insert(record)
        
        do {
            try context.save()
            try awardRandomPiece(context: context, allPieces: pohangPieces)
                
            appState.selectedTab = 0
            dismiss()
        } catch {
            print("저장실패: \(error)")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(alignment: .leading, spacing: 30) {
                    ActivityPhotoPicker(selectedImageDataList: $selectedImageDataList)
                    
                    LocationInput(
                        isFocused: $isFocused,
                        location: $location
                    )
                    
                    ActivityDatePicker(selectedDate: $selectedDate)
                    
                    Spacer()
                    
                    Button("작성 완료") {
                        saveActivity()
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .disabled(isSubmitDisabled)
                    
                }
                .padding(.horizontal, 23)
                .padding(.vertical, 28)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .glassEffect(.clear, in: .rect(cornerRadius: 38))
                .padding(.horizontal, 17)
                .padding(.bottom, -17)
            }
            .onTapGesture {
                isFocused = false
            }
        }
    }
}

#Preview {
    ActivityView(place: Place(name: "C5", level: "1", image: "C5"))
}
