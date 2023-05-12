//
//  Game.swift
//  Trivia
//
//  Created by Oliver Eikemeier on 13.10.15.
//  Copyright © 2015 Legacy Coderetreat. All rights reserved.
//

import Foundation



public class Game {
    var players: [Player] = []

    var currentPlayerIndex = 0
    var isGettingOutOfPenaltyBox = false
    
    
    var popCategory: QuestionCategory = PopCategory()
    var scienceCategory: QuestionCategory = ScienceCategory()
    var sportsCategory: QuestionCategory = SportsCategory()
    var rockCategory: QuestionCategory = RockCategory()
    var spaceCategory: QuestionCategory = SpaceCategory()
    
    public init(){
        generateQuestionsWithCount(questionsCount: 50)
        
        func generateQuestionsWithCount(questionsCount: Int) {
                        
            for i in 0..<(questionsCount - 1) {
                popCategory.questionsList.append("Pop Question \(i)")
                scienceCategory.questionsList.append(("Science Question \(i)"))
                sportsCategory.questionsList.append(("Sports Question \(i)"))
                rockCategory.questionsList.append(("Rock Question \(i)"))
                spaceCategory.questionsList.append(("Space Question \(i)"))
            }
        }
    }

    // MARK: Start add Players
    public func add(playerName: String) -> Bool {
        
        players.append(Player(playerName: playerName))
        
        print(playerName, "was added")
        print("They are player number", players.count)
        return true
    }
    
    
    // MARK: Starting game
    fileprivate func checkAndUpdatePlace() {
        if players[currentPlayerIndex].place > 11 {
            players[currentPlayerIndex].place -= 12
        }
    }
    
    
    
    // place -> question category
    func currentCategory(_ place: Int) -> QuestionCategory{

        if place == 0 || place == 3 || place == 4{
            return popCategory
        }else if place == 1 || place == 5 || place == 9{
            return scienceCategory
        }else if place == 2 || place == 6 || place == 10{
            return sportsCategory
        }else if place == 7 || place == 8 {
            return spaceCategory
        }else{
            return rockCategory
        }
    }
    
    
    private func canGetOutOfPenalety(_ roll: Int) {
        if roll % 2 != 0 {
            isGettingOutOfPenaltyBox = true
            
            print(players[currentPlayerIndex].playerName, "is getting out of the penalty box")
            players[currentPlayerIndex].place += roll
            
            checkAndUpdatePlace()
            
            print(players[currentPlayerIndex].playerName
                  + "'s new location is",
                  players[currentPlayerIndex].place)
            
            print("The category is", currentCategory(players[currentPlayerIndex].place))
            
            // MARK: Ask
            var categoryType = currentCategory(players[currentPlayerIndex].place)
            
            categoryType.askQuestion()
            
        } else {
            print(players[currentPlayerIndex].playerName, "is not getting out of the penalty box")
            isGettingOutOfPenaltyBox = false
        }
    }
    
    
    private func isPlayable() -> Bool {
        return players.count <= 6 && players.count >= 2
    }
    
    public func roll(roll: Int) throws {
        
        guard isPlayable() else{
            print("the game must have from 2 to 6 players")
            throw GameError.gameMustHaveMoreThanOnePlayer
            
        }
        
        print(players[currentPlayerIndex].playerName, "is the current player")
        print("They have rolled a", roll)
        
        if players[currentPlayerIndex].isPenalityBox {
            canGetOutOfPenalety(roll)
            
        } else {
            
            players[currentPlayerIndex].place += roll
            
            checkAndUpdatePlace()
            
            print(players[currentPlayerIndex].playerName
                  + "'s new location is",
                  players[currentPlayerIndex].place)
            print("The category is", currentCategory(players[currentPlayerIndex].place))
            
            // MARK: Ask
            var categoryType = currentCategory(players[currentPlayerIndex].place)
            
            categoryType.askQuestion()
            
        }
        
    }
    
    private func moveToNextPlayer(){
        currentPlayerIndex += 1
        // reached end of the list + 1 then go to zero index
        if currentPlayerIndex == players.count {currentPlayerIndex = 0}
    }
    
    private func gettingOut() -> Bool {
        if isGettingOutOfPenaltyBox {
            print("Answer was correct!!!!")
            players[currentPlayerIndex].purse += 1
            print(players[currentPlayerIndex].playerName,
                  "now has",
                  players[currentPlayerIndex].purse,
                  "Gold Coins.")
            
            moveToNextPlayer()
            
            return didPlayerWin
            
        } else {
            moveToNextPlayer()
            return true
        }
    }
    
    // MARK: Answers Methods
    public func wasCorrectlyAnswered() -> Bool {
        if players[currentPlayerIndex].isPenalityBox{
            return gettingOut()
            
        } else {
            
            print("Answer was correct!!!!")
            players[currentPlayerIndex].purse += 1
            print(players[currentPlayerIndex].playerName,
                  "now has",
                  players[currentPlayerIndex].purse,
                  "Gold Coins.")
            
            
            moveToNextPlayer()
            
            return didPlayerWin
        }
    }
    
    public func wrongAnswer()->Bool{
        print("Question was incorrectly answered")
        print(players[currentPlayerIndex].playerName, "was sent to the penalty box")
        players[currentPlayerIndex].isPenalityBox = true
        
        moveToNextPlayer()
        return true
    }
    
    
    // MARK: Did win
    private var didPlayerWin: Bool {
        return !(players[currentPlayerIndex].purse == 6)
    }
}

enum GameError: Error{
    case gameMustHaveMoreThanOnePlayer
}

// MARK: - Questions Category
protocol QuestionCategory{
    var questionsList: [String] {get set}
    mutating func askQuestion()

}
extension QuestionCategory{
    mutating func askQuestion(){
        if questionsList.count > 0{
            let removedQuestion = questionsList.removeFirst()
            questionsList.append(removedQuestion)
            print(removedQuestion)
        }
    }
}
class PopCategory: QuestionCategory{
    var questionsList = [String]()
}

class ScienceCategory: QuestionCategory{
    var questionsList = [String]()
}

class SportsCategory: QuestionCategory{
    var questionsList = [String]()
 
}

class RockCategory: QuestionCategory{
    var questionsList = [String]()
}

class SpaceCategory: QuestionCategory{
    var questionsList = [String]()
}


//MARK: Player
class Player{
    
    var purse = 0
    var place = 0
    var isPenalityBox = false
    
    var playerName: String
    
    init(playerName: String) {
        self.playerName = playerName
    }
}
