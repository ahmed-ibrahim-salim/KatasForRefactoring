//
//  DriverTests.swift
//  RaceKataLeaderBoardTests
//
//  Created by magdy khalifa on 21/05/2023.
//

import XCTest
@testable import RaceKataLeaderBoard

final class DriverTests: XCTestCase {

    var driver1: Driver!
    var driver2: Driver!
    var driver3: Driver!

    var race1: Race!
    
    override func setUpWithError() throws {
         driver1 = Driver(name: "Nico Rosberg", country: "DE")
         driver2 = Driver(name: "Lewis Hamilton", country: "UK")
         driver3 = Driver(name: "Sebastian Vettel", country: "DE")


        race1 = Race(name: "Australian Grand Prix", results: [driver1, driver2, driver3])


    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDriverPoints() {
        XCTAssertEqual(25, race1.points(driver: driver1))
        XCTAssertEqual(18, race1.points(driver: driver2))
        XCTAssertEqual(15, race1.points(driver: driver3))
    }

}
