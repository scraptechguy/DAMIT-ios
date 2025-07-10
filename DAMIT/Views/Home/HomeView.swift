//
//  HomeView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 23.06.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    @State var selectedAsteroid: String?
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBar()
                
                ZStack {
                    SearchView(selectedAsteroid: $selectedAsteroid)
                    
                    AsteroidModelDetail(asteroid: selectedAsteroid ?? "")
                        .offset(x: model.isShowingAsteroidDetail ? 0 : model.screenSize.width)   // hidden off-screen when closed
                        .animation(.easeInOut(duration: 0.3), value: model.isShowingAsteroidDetail)
                    
                    MenuView()
                        .offset(x: model.isShowingMenu ? 0 : model.screenSize.width)   // hidden off-screen when closed
                        .animation(.easeInOut(duration: 0.3), value: model.isShowingMenu)
                    
                    SideSheetView()
                        .offset(x: model.isShowingSideSheet ? 0 : model.screenSize.width)
                        .animation(.easeInOut(duration: 0.3), value: model.isShowingSideSheet)
                }
            }.ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ContentModel())
}
