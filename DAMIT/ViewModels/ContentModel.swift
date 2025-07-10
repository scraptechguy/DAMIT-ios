//
//  ContentModel.swift
//  DAMIT
//
//  Created by Rostislav Brož on 09.07.2025.
//

import SwiftUI

class ContentModel: ObservableObject {
    let screenSize: CGRect = UIScreen.main.bounds
    
    @Published var isShowingMenu: Bool = false
    @Published var isShowingSideSheet: Bool = false
    @Published var isShowingAsteroidDetail: Bool = false
    @Published var isSearchFocusedState: Bool = false
}
