//
//  FetchData.swift
//  DAMIT
//
//  Created by Rostislav Brož on 24.07.2025.
//

import Foundation
import SwiftUI
import Combine

class FetchData: ObservableObject {
    @Published var dataList = [Asteroid]()
    @Published var finishedLoading = false
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://f3490cbfaa41.ngrok-free.app/asteroids/")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    #if DEBUG
                    print("using online data")
                    #endif
                    
                    let decodedData = try JSONDecoder().decode([Asteroid].self, from: todoData)
                    
                    DispatchQueue.main.async { [self] in
                        withAnimation {
                            finishedLoading = true
                        }
                        
                        self.dataList = decodedData
                    }
                } else {
                    #if DEBUG
                    print("offline")
                    #endif
                }
            } catch let error {
                #if DEBUG
                print(error)
                #endif
            }
        }.resume()
    }
}
