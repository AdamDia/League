//
//  MatchesViewModel.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import SwiftUI

class MatchesViewModel: ObservableObject {
    
    @Published var matches = [Match]()
    var networkManager: NetworkProtocol
    @AppStorage("favoriteMatches") var favoriteMatchesData: Data = Data()
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
        favoriteMatches.removeAll(where: {$0.utcDate == "0909"})
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
    
    var favoriteMatches: [Match] {
            get {
                if let decoded = try? JSONDecoder().decode([Match].self, from: favoriteMatchesData) {
                    return decoded
                }
                return []
            }
            set {
                if let encoded = try? JSONEncoder().encode(newValue) {
                    favoriteMatchesData = encoded
                }
            }
        }
    
    func toggleFavorite(match: Match) {
        if favoriteMatches.contains(match) {
                favoriteMatches.removeAll(where: { $0 == match })
            } else {
                favoriteMatches.append(match)
            }
        }
    
}
