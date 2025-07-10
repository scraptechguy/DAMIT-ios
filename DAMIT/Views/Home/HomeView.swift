//
//  HomeView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 23.06.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBar()
                
                ZStack {
                    SearchView()
                    
                    MenuView()
                        .offset(x: model.isShowingMenu ? 0 : model.screenSize.width)   // hidden off-screen when closed
                        .animation(.easeInOut(duration: 0.3), value: model.isShowingMenu)
                }
            }.ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ContentModel())
}
