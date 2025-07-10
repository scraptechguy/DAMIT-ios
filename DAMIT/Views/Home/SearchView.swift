//
//  SearchView.swift
//  DAMIT
//
//  Created by Rostislav Brož on 09.07.2025.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var model: ContentModel
    
    @Binding var selectedAsteroid: String?
    
    @State private var searchText: String = ""
    @State private var randomAsteroids: [String] = []
    
    @FocusState private var isSearchFocused: Bool
    
    init(selectedAsteroid: Binding<String?>) {
        self._selectedAsteroid = selectedAsteroid
    }
    
    private var asteroids: [String] = ["Juno", "Ceres", "Pallas", "Vesta", "Dione", "Titan", "Rhea", "Iapetus"]
    
    private func loadRandomAsteroids() {
        randomAsteroids = Array(asteroids.shuffled().prefix(6))
    }
    
    private var filteredAsteroids: [String] {
        let source = asteroids
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if query.isEmpty {
            
            return randomAsteroids
            
        } else {
            
            return source.filter { asteroid in asteroid.localizedCaseInsensitiveContains(query) }
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    HStack {
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                isSearchFocused = true
                            }, label: {
                                Text("🔍")
                                    .padding(.leading)
                            })
                            
                            TextField("Search asteroids", text: $searchText)
                                .focused($isSearchFocused)
                                .padding(.trailing)
                                .keyboardType(.asciiCapable)
                            
                            Spacer()
                            
                            if !searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                                Button(action: {
                                    searchText = ""
                                    isSearchFocused = false
                                }, label: {
                                    Image(systemName: "multiply")
                                        .foregroundStyle(Color.secondary)
                                        .padding(.trailing)
                                })
                            }
                        }.frame(width: model.screenSize.width / 1.6, height: model.screenSize.height / 20)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 1))
                                    .foregroundStyle(Color.gray)
                            )
                        
                        Spacer()
                    }.padding()
                    
                    Text("(10755 asteroids with 16091 models and 5 tumblers)")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                        .padding([.horizontal, .bottom])
                        .padding(.bottom)
                    
                    if !filteredAsteroids.isEmpty {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Models")
                                .bold()
                                .foregroundColor(Color.primary)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            Group {
                                Text("λ")
                                    .bold()
                                
                                Text("β")
                                    .bold()
                                
                                Text("*P*")
                                    .bold()
                            }.foregroundStyle(Color.primary)
                                .scaledToFit()
                                .frame(width: model.screenSize.width / 7)
                                .padding(.horizontal)
                        }.padding(.bottom)
                        
                        Rectangle()
                            .foregroundStyle(Color.secondary)
                            .frame(width: model.screenSize.width, height: 1)
                    }
                    
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
                            .bold()
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                    } else if searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                        Button(action: {
                            loadRandomAsteroids()
                        }, label: {
                            Text("Shuffle recommended asteroids")
                                .bold()
                                .font(.callout)
                                .foregroundStyle(Color.secondary)
                                .padding()
                        })
                    }
                }
            }.onAppear {
                loadRandomAsteroids()
            }
            .onChange(of: model.isSearchFocusedState) {
                isSearchFocused = model.isSearchFocusedState
            }
            .onChange(of: isSearchFocused) {
                model.isSearchFocusedState = isSearchFocused
            }
        }
    }
    
    @ViewBuilder
    func asteroidRow(for asteroid: String) -> some View {
        Button(action: {
            isSearchFocused = false
            selectedAsteroid = asteroid
            
            withAnimation(.easeInOut(duration: 0.3)) {
                model.isShowingAsteroidDetail = true
            }
        }, label: {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack {
                        HStack(alignment: .center, spacing: 0) {
                            Text(asteroid)
                                .foregroundColor(Color.primary)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Group {
                                Text("103")
                                Text("27")
                                Text("7.209531")
                            }.foregroundStyle(Color.primary)
                                .scaledToFit()
                                .frame(width: model.screenSize.width / 7)
                                .padding(.horizontal)
                        }

                        Text("nonconvex model reconstructed from ALMA+AO+LC")
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
    SearchView(selectedAsteroid: .constant("Ceres"))
        .environmentObject(ContentModel())
}
