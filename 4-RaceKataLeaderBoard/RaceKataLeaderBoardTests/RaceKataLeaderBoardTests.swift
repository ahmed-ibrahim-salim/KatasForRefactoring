//
//  RaceKataLeaderBoardTests.swift
//  RaceKataLeaderBoardTests
//
//  Created by magdy khalifa on 21/05/2023.
//

import XCTest
@testable import RaceKataLeaderBoard

final class RaceKataLeaderBoardTests: XCTestCase {

    var sampleLeaderboard1: Leaderboard!
    var sampleLeaderboard2: Leaderboard!

    override func setUpWithError() throws {
        let driver1 = Driver(name: "Nico Rosberg", country: "DE")
        let driver2 = Driver(name: "Lewis Hamilton", country: "UK")
        let driver3 = Driver(name: "Sebastian Vettel", country: "DE")
        
        let driver4 = SelfDrivingCar(name: nil, country: "", algorithmVersion: 1, company: "Acme")

        let race1 = Race(name: "Australian Grand Prix",
                         results: [driver1, driver2, driver3])
        let race2 = Race(name: "Malaysian Grand Prix",
                         results: [driver3, driver2, driver1])
        let race3 = Race(name: "Chinese Grand Prix",
                         results: [driver2, driver1, driver3])
       

         sampleLeaderboard1 = Leaderboard(races: [race1, race2, race3])
        
         // board ---- race --  driver
        //
        let race4 = Race(name: "Fictional Grand Prix",
                         results: [driver1, driver2, driver4])
        
        let race5 = Race(name: "Fictional Grand Prix",
                         results: [driver4, driver2, driver1])
        
        driver4.algorithmVersion = 2
        let race6 = Race(name: "Fictional Grand Prix",
                         results: [driver2, driver1, driver4])
        
        sampleLeaderboard2 = Leaderboard(races: [race4, race5, race6])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWinner() {
        XCTAssertEqual("Lewis Hamilton", sampleLeaderboard1.driverRankings()[0])
    }

    func testDriverPoints() {
        XCTAssertEqual(18 + 18 + 25, sampleLeaderboard1.driverPoints()["Lewis Hamilton"])
    }
    
    
    func testWinnerForSecondLeaderboard() {
        
        //second driver is winning
        
        XCTAssertEqual("Lewis Hamilton", sampleLeaderboard2.driverRankings()[0])
    }

    func testDriverPointsForSecondLeaderboard() {
        XCTAssertEqual(18 + 18 + 25, sampleLeaderboard2.driverPoints()["Lewis Hamilton"])
    }
}
