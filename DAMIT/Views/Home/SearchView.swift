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
    
    private var asteroids: [String] = ["Juno", "Ceres", "Pallas", "Vesta", "Dione", "Titan", "Rhea", "Iapetus"]
    private var filteredAsteroids: [String] {
        let source = asteroids
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if query.isEmpty {
            
            return ["Juno", "Ceres"]
            
        } else {
            
            return source.filter { asteroid in asteroid.localizedCaseInsensitiveContains(query) }
        }
    }
    
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
                
                ForEach(Array(filteredAsteroids.enumerated()), id: \.offset) { index, asteroid in
                    asteroidRow(for: asteroid)
                }
                
                if asteroids.isEmpty {
                    
                    ProgressView("Loading...")
                        .padding(.top)
                                      
                    Spacer()
                    
                } else if !searchText.trimmingCharacters(in: .whitespaces).isEmpty && filteredAsteroids.isEmpty {
                                 
                    Spacer()
                     
                    Text("No matches")
                        .foregroundColor(.secondary)
                        .bold()
                        .multilineTextAlignment(.center)
                     
                    Spacer()
                                 
                } else if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                    Text("© 2008–2025 Astronomical Institute of the Charles University, Josef Ďurech, Vojtěch Sidorin, Rostislav Brož | Except where otherwise stated, content on this site is licensed under a Creative Commons Attribution 4.0 International License. | Main contact: Josef Ďurech (durech@sirrah.troja.mff.cuni.cz)")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                        .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    func asteroidRow(for asteroid: String) -> some View {
        Button(action: {
            isFocused = false
        }, label: {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack {
                        Text(asteroid)
                            .foregroundColor(Color.primary)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)

                            Text("asteroid")
                                .foregroundColor(.secondary)
                                .font(.footnote)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                    }.padding(.vertical)
                }
                
                Divider()
            }
        })
    }
}

#Preview {
    SearchView()
        .environmentObject(ContentModel())
}
