//
//  NavigationBar.swift
//  DAMIT
//
//  Created by Rostislav Brož on 10.07.2025.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if model.isShowingMenu || model.isShowingSideSheet || model.isShowingAsteroidDetail {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            if model.isShowingSideSheet {
                                model.isShowingSideSheet = false
                            } else if model.isShowingMenu {
                                model.isShowingMenu = false
                            } else if model.isShowingAsteroidDetail {
                                model.isShowingAsteroidDetail = false
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.primary)
                            .padding(.leading)
                    })
                    
                    Spacer()
                }
                
                Image("DAMIT_logo")
                    .padding(.leading)
                
                Text("DAMIT")
                    .bold()
                    .font(.title3)
                
                Spacer()
                
                Button(action: {
                    if !model.isShowingSideSheet {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            model.isShowingMenu.toggle()
                            model.isSearchFocusedState = false
                        }
                    }
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(Color.primary)
                        .padding(.trailing)
                        .opacity(model.isShowingSideSheet ? 0 : 1)
                })
            }.frame(width: model.screenSize.width)
                .padding(.vertical)
                .background(.thinMaterial)
                
            Divider()
        }.ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NavigationBar()
        .environmentObject(ContentModel())
}
