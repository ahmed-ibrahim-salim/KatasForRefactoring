//
//  TriviaTests.swift
//  TriviaTests
//
//  Created by Oliver Eikemeier on 14.10.15.
//  Copyright © 2015 Legacy Coderetreat. All rights reserved.
//

import XCTest


class TriviaTests: XCTestCase {
    var game: Game!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         game = Game()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        game
    }
  
    func test_WhenAddedOnePlayer_WeGetError() throws{
        
        // given
        let game = Game()
        
        // When
        _ = game.add(playerName: "Chet")

        
        // Then
        XCTAssertThrowsError(try game.roll(roll: Int(arc4random_uniform(5)) + 1))
    }
    
    func test_WhenAddedSevenPlayer_WeGetError() throws{
        
        // given
        
        // When
        for _ in 0...6{
            _ = game.add(playerName: "Chet")

        }
        
        // Then
        XCTAssertThrowsError(try game.roll(roll: Int(arc4random_uniform(5)) + 1))
    }
}
