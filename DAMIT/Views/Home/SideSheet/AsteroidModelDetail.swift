//
//  AsteroidModelDetail.swift
//  DAMIT
//
//  Created by Rostislav Brož on 10.07.2025.
//

import SwiftUI

struct AsteroidModelDetail: View {
    var asteroid: String
    
    var body: some View {
        Text(asteroid)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThickMaterial)
    }
}

#Preview {
    AsteroidModelDetail(asteroid: "Juno")
}
