//
//  NetworkManagerTests.swift
//  LeagueTests
//
//  Created by Adam Essam on 03/04/2023.
//

import XCTest
@testable import League

final class NetworkManagerTests: XCTestCase {
    private var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
    }
    
    override func tearDown() {
         super.tearDown()
        mockNetworkManager = nil
    }
    
    func test_getMatches() {
        mockNetworkManager.getMatches { result in
            switch result {
            case .success(let matches):
                XCTAssertEqual(matches.count, 2)
            case .failure(let failure):
                XCTAssertEqual(failure, .invalidData)
            }
        }
    }
}
