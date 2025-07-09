//
//  LaunchView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 09.07.2025.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        HomeView()
    }
}

#Preview {
    LaunchView()
}
