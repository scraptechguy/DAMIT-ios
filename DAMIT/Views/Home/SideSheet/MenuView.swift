//
//  MenuView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 09.07.2025.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                Button(action: {
                    
                }, label: {
                    Text("Models 🪨")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 3.5)
                
                Button(action: {
                    
                }, label: {
                    Text("Tumblers")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 3)
                
                Button(action: {
                    
                }, label: {
                    Text("Tables 📁")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 4)
                
                Button(action: {
                    
                }, label: {
                    Text("Export 📤")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 4)
                
                Button(action: {
                    
                }, label: {
                    Text("Documentation 📖")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 2.5)
                
                Button(action: {
                    
                }, label: {
                    Text("App Settings 🔧")
                        .bold()
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .padding()
                })
                
                Divider()
                    .frame(width: model.screenSize.width / 1.5)
                
                Text("© 2025 Astronomical Institute of the Charles University, Josef Ďurech, Vojtěch Sidorin, Rostislav Brož | Except where otherwise stated, content on this site is licensed under a Creative Commons Attribution 4.0 International License. | Main contact: Rostislav Brož (scraptechguy@gmail.com)")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
                    .padding()
            }.padding(.top)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThickMaterial)
    }
}

#Preview {
    MenuView()
        .environmentObject(ContentModel())
}
