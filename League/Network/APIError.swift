//
//  APIError.swift
//  League
//
//  Created by Adam Essam on 01/04/2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
