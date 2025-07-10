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
                if model.isShowingMenu || model.isShowingSideSheet {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            if model.isShowingMenu {
                                model.isShowingMenu = false
                            } else if model.isShowingSideSheet {
                                model.isShowingSideSheet = false
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.primary)
                            .scaleEffect(1.3)
                            .padding(.leading)
                    })
                    
                    Spacer()
                }
                
                Image("DAMIT_logo")
                    .padding(.leading)
                
                Text("DAMIT")
                    .bold()
                    .font(.title2)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        model.isShowingMenu.toggle()
                    }
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(Color.primary)
                        .padding(.trailing)
                        .scaleEffect(1.3)
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
