//
//  NetworkManager.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import Foundation
import Moya

enum MyAPI {
    case getPLMatches
}

extension MyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.football-data.org/v4/competitions/PL")!
    }
    
    var path: String {
        switch self {
        case .getPLMatches:
            return "/matches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPLMatches:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPLMatches:
            return .requestPlain
        }
    }
    var headers: [String: String]? {
        return ["X-Auth-Token":"8c1937c7595e4cecadc95c15c3c90421",
                "Content-Type": "application/json"]
    }
}

class NetworkManager {
    private let provider = MoyaProvider<MyAPI>()
    
    func getMatches(completion: @escaping (Result<[Match], APIError>) -> Void) {
        provider.request(.getPLMatches) { result in
            switch result {
            case .success(let response):
                do {
                    let matchesData = try response.map(MatchesDataModel.self)
                    completion(.success(
                        matchesData.matches))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(_):
                completion(.failure(.invalidResponse))
            }
        }
    }
}
