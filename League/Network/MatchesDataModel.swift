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
struct Match: Codable, Identifiable {
    let id: Int
    let utcDate: String
    let homeTeam, awayTeam: Team
    let score: Score

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
    let winner: String?
    let fullTime: Time
    
}

// MARK: - Time
struct Time: Codable {
    let home, away: Int?
}

