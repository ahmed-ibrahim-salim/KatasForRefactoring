//
//  TriviaTests.swift
//  TriviaTests
//
//  Created by Oliver Eikemeier on 14.10.15.
//  Copyright © 2015 Legacy Coderetreat. All rights reserved.
//

import XCTest


class TriviaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func test_WhenAddedTwoPlayers_WeGetTwoPlayers(){
        
        let game = Game()
        
        _ = game.add(playerName: "Chet")
        _ = game.add(playerName: "Pat")
       
        XCTAssertEqual(2, game.players.count)
        
        
        
    }
    func test_WhenAddedOnePlayer_WeGetError() throws{
        
        // given
        let game = Game()
        
        // When
        _ = game.add(playerName: "Chet")

        
        // Then
        XCTAssertThrowsError(try game.roll(roll: Int(arc4random_uniform(5)) + 1))

       
        
        
        
    }
}
