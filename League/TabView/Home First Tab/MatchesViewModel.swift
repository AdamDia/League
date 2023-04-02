//
//  MatchesViewModel.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import SwiftUI

class MatchesViewModel: ObservableObject {
    @Published var matches = [Match]()
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getPLMatches() {
        networkManager.getMatches { result in
            switch result {
            case .success(let matches):
                self.matches = matches
            case .failure(let failure):
                print("\(failure)")
            }
        }
    }
    
    
}
