//
//  SideSheetView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 10.07.2025.
//

import SwiftUI

struct SideSheetView: View {
    @EnvironmentObject var model: ContentModel
    
    @Binding var selectedAsteroid: String?
    
    var body: some View {
        AsteroidModelDetail(asteroid: selectedAsteroid ?? "")
    }
}

#Preview {
    SideSheetView(selectedAsteroid: .constant("Ceres"))
        .environmentObject(ContentModel())
}
