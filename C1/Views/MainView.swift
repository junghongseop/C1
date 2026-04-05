//
//  MainView.swift
//  C1
//
//  Created by 정홍섭 on 3/27/26.
//

import SwiftUI

struct MainView: View {
    @AppStorage("savedLocation") var savedLocation: String = ""
    
    @State var showingSheet: Bool = false
    @State var navigationToActivity = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                Image("pohang")
                    .resizable()
                    .scaledToFit()
                    .offset()
                    .overlay(
                        ZStack {
                            if savedLocation == "C5" {
                                Image("hyogok")
                                    .resizable()
                                    .frame(width: 83, height: 80)
                                    .position(x: 244, y: 192)
                            }
                            
                            Button{
                                showingSheet.toggle()
                            } label: {
                                Image("map-marker")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundStyle(.red)
                                    .padding(0)
                                    .frame(width: 40, height: 40)
                                    .clipped()
                                    .position(x: 246, y: 190)
                            }
                        }
                    )
                
                Button("초기화") {
                    print("클릭")
                    self.savedLocation = ""
                }.position(x: 30, y: 10).foregroundStyle(Color.clear)
            }
            .sheet(isPresented: $showingSheet) {
                LocationSheetView(navigationToActivity: $navigationToActivity)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .navigationDestination(isPresented: $navigationToActivity) {
                ActivityView()
            }
        }
    }
}

#Preview {
    MainView()
}
