//
//  MatchesViewModel.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import SwiftUI


class MatchesViewModel: ObservableObject {
    
    @AppStorage("favoriteMatches") var favoriteMatchesData: Data = Data()
    @Published var matches = [Match]()
    @Published var isLoading: Bool = false
    var networkManager: NetworkProtocol
    var shouldFetchData = true
    private var decodedFavoriteMatches: Set<Match>?
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
        removeElementFromFavSet()
        loadFavorites()
    }
    
    private func removeElementFromFavSet() {
        if let elementToRemove = favoriteMatches.first(where: { $0.utcDate == "0909" }), let decodedToRemove = decodedFavoriteMatches?.first(where: {$0.utcDate == "0909"}) {
            favoriteMatches.remove(elementToRemove)
            decodedFavoriteMatches?.remove(decodedToRemove)
        }
    }
    
    //MARK: - Sorting matches by date
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()

    var matchesByDate: [Date: [Match]] {
        return Dictionary(grouping: matches) { match in
            let utcDate = dateFormatter.date(from: match.utcDate) ?? Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: utcDate)
            return calendar.date(from: components)!
        }
    }
    
    var sortedDates: [Date] {
        Array(matchesByDate.keys).sorted()
    }
    
    
    //MARK: - Get matches
     func getPLMatches() {
         guard shouldFetchData else { return }
        isLoading = true
        networkManager.getMatches { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let matches):
                self.matches = matches
            case .failure(let failure):
                print("\(failure)")
            }
        }
         shouldFetchData = false
    }
       
    //MARK: - Favorites

    
    var favoriteMatches: Set<Match> {
        get {
                if let decodedMatches = decodedFavoriteMatches {
                    return decodedMatches
                }
                if let decoded = try? JSONDecoder().decode(Set<Match>.self, from: favoriteMatchesData) {
                    decodedFavoriteMatches = decoded
                    return decoded
                }
                return []
            }
            set {
                if let encoded = try? JSONEncoder().encode(newValue) {
                    favoriteMatchesData = encoded
                    decodedFavoriteMatches = newValue
                }
            }
    }

    func toggleFavorite(match: Match) {
        if favoriteMatches.contains(match) {
            favoriteMatches.remove(match)
        } else {
            favoriteMatches.insert(match)
        }
    }
    
    func loadFavorites() {
        let defaults = UserDefaults.standard
        if let savedMatchesData = defaults.data(forKey: "favoriteMatches"),
           let savedMatches = try? JSONDecoder().decode(Set<Match>.self, from: savedMatchesData) {
            favoriteMatches = savedMatches
            decodedFavoriteMatches = savedMatches
        }
    }
}

