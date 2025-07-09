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
                HStack {
                    Image("DAMIT_logo")
                        .padding(.leading)
                    
                    Text("DAMIT")
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    Button(action: {
                        
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
                
                SearchView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ContentModel())
}
