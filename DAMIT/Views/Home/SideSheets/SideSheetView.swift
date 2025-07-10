//
//  SideSheetView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 10.07.2025.
//

import SwiftUI

struct SideSheetView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("side sheet")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThickMaterial)
    }
}

#Preview {
    SideSheetView()
        .environmentObject(ContentModel())
}
