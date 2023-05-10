//
//  Game.swift
//  Trivia
//
//  Created by Oliver Eikemeier on 13.10.15.
//  Copyright © 2015 Legacy Coderetreat. All rights reserved.
//

import Foundation


//class Player{
//    var name: String
//    var place = 0
//    var purse = 0
//    var inPenalityBox = false
//
//    init(name: String) {
//        self.name = name
//    }
//
//}


public class Game {
    var players = [String]()
    var places = [Int](repeating: 0, count: 6)
    var purses  = [Int](repeating: 0, count: 6)
    var inPenaltyBox  = [Bool](repeating: false, count: 6)
    
    var popQuestions = [String]()
    var scienceQuestions = [String]()
    var sportsQuestions = [String]()
    var rockQuestions = [String]()
    
    var currentPlayer = 0
    var isGettingOutOfPenaltyBox = false
    
    public init(){
    	for i in 0..<50 {
			popQuestions.append("Pop Question \(i)")
			scienceQuestions.append(("Science Question \(i)"))
			sportsQuestions.append(("Sports Question \(i)"))
            rockQuestions.append(createRockQuestion(index: i))
    	}
    }

    private func createRockQuestion(index: Int) -> String{
		return "Rock Question \(index)"
	}
	
	private func isPlayable() -> Bool {
		return howManyPlayers() <= 6 && howManyPlayers() >= 2
	}

    // MARK: Start add Players
    public func add(playerName: String) -> Bool {
		
		
	    players.append(playerName)
        places.append(0)
        purses.append(0)
        inPenaltyBox.append(false)

        
	    print(playerName, "was added")
	    print("They are player number", players.count)
		return true
	}
	
	private func howManyPlayers() -> Int {
		return players.count
	}

    // MARK: Starting game
    public func roll(roll: Int) throws {
        
        guard isPlayable() else{
            print("the game must have from 2 to 6 players")
            throw GameError.gameMustHaveMoreThanOnePlayer
            
        }
        
		print(players[currentPlayer], "is the current player")
		print("They have rolled a", roll)
		
		if inPenaltyBox[currentPlayer] {
			if roll % 2 != 0 {
				isGettingOutOfPenaltyBox = true
				
				print(players[currentPlayer], "is getting out of the penalty box")
				places[currentPlayer] = places[currentPlayer] + roll
                if places[currentPlayer] > 11 {places[currentPlayer] = places[currentPlayer] - 12}
				
				print(players[currentPlayer]
						+ "'s new location is",
						places[currentPlayer])
				print("The category is", currentCategory())
				askQuestion()
			} else {
				print(players[currentPlayer], "is not getting out of the penalty box")
				isGettingOutOfPenaltyBox = false
				}
			
		} else {
		
			places[currentPlayer] = places[currentPlayer] + roll
            if places[currentPlayer] > 11 {places[currentPlayer] = places[currentPlayer] - 12}
			
			print(players[currentPlayer]
					+ "'s new location is",
					places[currentPlayer])
			print("The category is", currentCategory())
			askQuestion()
		}
		
	}

 	private func askQuestion() {
        if currentCategory() == "Pop" {
            print(popQuestions.removeFirst())}
        if currentCategory() == "Science"{
            print(scienceQuestions.removeFirst())}
        if currentCategory() == "Sports"{
            print(sportsQuestions.removeFirst())}
        if currentCategory() == "Rock"{
            print(rockQuestions.removeFirst())}
	}
	
	
	private func currentCategory() -> String {
        if places[currentPlayer] == 0 {return "Pop"}
		if places[currentPlayer] == 4 {return "Pop"}
		if places[currentPlayer] == 8 {return "Pop"}
		if places[currentPlayer] == 1 {return "Science"}
		if places[currentPlayer] == 5 {return "Science"}
		if places[currentPlayer] == 9 {return "Science"}
		if places[currentPlayer] == 2 {return "Sports"}
		if places[currentPlayer] == 6 {return "Sports"}
		if places[currentPlayer] == 10 {return "Sports"}
		return "Rock"
	}

    fileprivate func gettingOut() -> Bool {
        if isGettingOutOfPenaltyBox {
            print("Answer was correct!!!!")
            purses[currentPlayer] += 1
            print(players[currentPlayer],
                  "now has",
                  purses[currentPlayer],
                  "Gold Coins.")
            
            moveToNextPlayer()
            
            return didPlayerWin
            
            } else {
                moveToNextPlayer()
                return true
            }
        }

    private func moveToNextPlayer(){
        currentPlayer += 1
        if currentPlayer == players.count {currentPlayer = 0}
    }
    public func wasCorrectlyAnswered() -> Bool {
		if inPenaltyBox[currentPlayer]{
            return gettingOut()
			
		} else {
		
			print("Answer was correct!!!!")
			purses[currentPlayer] += 1
			print(players[currentPlayer],
					"now has",
					purses[currentPlayer],
					"Gold Coins.")
			
            
            moveToNextPlayer()
			
			return didPlayerWin
		}
	}
	
	public func wrongAnswer()->Bool{
		print("Question was incorrectly answered")
		print(players[currentPlayer], "was sent to the penalty box")
		inPenaltyBox[currentPlayer] = true
		
        moveToNextPlayer()
		return true
	}


    private var didPlayerWin: Bool {
		return !(purses[currentPlayer] == 6)
	}
}

enum GameError: Error{
    case gameMustHaveMoreThanOnePlayer
}
