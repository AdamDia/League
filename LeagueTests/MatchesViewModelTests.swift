//
//  MatchesViewModelTests.swift
//  LeagueTests
//
//  Created by Adam Essam on 03/04/2023.
//

import XCTest
@testable import League

final class MatchesViewModelTests: XCTestCase {
    private var viewModel: MatchesViewModel!
    private var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = MatchesViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetworkManager = nil
        viewModel = nil
    }
    
    func testGetPLMatchesSuccess() {
        // Given, When
        viewModel.getPLMatches()
        
        // Then
        XCTAssertEqual(viewModel.matches.count, 2)
        XCTAssertEqual(viewModel.matches.first!.utcDate, "2023-04-01T10:00:00Z")
    }
    
    func testGetPLMatchesFailure() {
        // Given
        mockNetworkManager.shouldFail = true
        
        // When
        viewModel.getPLMatches()
        
        // Then
        XCTAssertEqual(viewModel.matches.count, 0)
    }
    
    func testToggleFavorite() {
        // Given
        let match1 = Match(id: 10, utcDate: "0909", homeTeam: Team(name: "Arsenal", clubIcon: ""), awayTeam: Team(name: "Man UNT", clubIcon: ""), score: Score(fullTime: Time(home: 2, away: 1)))
        
        // When
        viewModel.toggleFavorite(match: match1)
        
        // Then
        XCTAssertTrue(viewModel.favoriteMatches.contains(match1))
    }
}
