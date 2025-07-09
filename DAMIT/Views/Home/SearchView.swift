//
//  SearchView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 09.07.2025.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var model: ContentModel
    
    @State private var searchText: String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    TextField("🔍  Search asteroids", text: $searchText)
                        .padding()
                        .frame(width: model.screenSize.width / 1.8, height: model.screenSize.height / 20)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .foregroundStyle(Color.gray)
                        )
                    
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(ContentModel())
}
