//
//  MockNetworkManager.swift
//  LeagueTests
//
//  Created by Adam Essam on 03/04/2023.
//

import Foundation
@testable import League

final class MockNetworkManager: NetworkProtocol, JsonLoader {
    var mockMatches = [Match]()
    var shouldFail = false
    
    func getMatches(completion: @escaping (Result<[League.Match], League.APIError>) -> Void) {
        loadJSON(filename: "MatchesMockJSON", type: MatchesDataModel.self) { result in
            if !self.shouldFail{
                switch result {
                case .success(let success):
                    completion(.success(success.matches))
                case .failure:
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.invalidData))
            }
        }
    }
}
