//
//  MatchesDataModel.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import Foundation

struct MatchesDataModel: Codable {
    let matches: [Match]
}

// MARK: - Match
struct Match: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let utcDate: String
    let homeTeam, awayTeam: Team
    let score: Score

    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }
}

// MARK: - Team
struct Team: Codable {
    let name: String
    let clubIcon: String
    
    enum CodingKeys: String ,CodingKey {
        case name
        case clubIcon = "crest"
    }
}

// MARK: - Score
struct Score: Codable {
//    let winner: String?
    let fullTime: Time
    
}

// MARK: - Time
struct Time: Codable {
    let home, away: Int?
}

