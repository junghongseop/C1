//
//  ActivityDatePicker.swift
//  C1
//
//  Created by 정홍섭 on 4/17/26.
//

import SwiftUI

struct ActivityDatePicker: View {
    @State var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("날짜")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .heavy))
            
            DatePicker(
                "날짜 선택",
                selection: $selectedDate,
                in: ...Date(),
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .environment(\.locale, Locale(identifier: "ko_KR"))
            .labelsHidden()
            .tint(Color.black)
        }
    }
}

#Preview {
    ActivityDatePicker()
}
