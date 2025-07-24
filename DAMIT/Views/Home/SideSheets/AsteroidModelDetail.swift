//
//  AsteroidModelDetail.swift
//  DAMIT
//
//  Created by Rostislav Brož on 10.07.2025.
//

import SwiftUI

struct AsteroidModelDetail: View {
    @EnvironmentObject var data: FetchData
    var asteroid: String
    
    var body: some View {
        ForEach(Array(data.dataList.enumerated()), id: \.offset) { index, aster in
            Text(aster.name ?? "")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThickMaterial)
        }
    }
}

#Preview {
    AsteroidModelDetail(asteroid: "Juno")
        .environmentObject(FetchData())
}
