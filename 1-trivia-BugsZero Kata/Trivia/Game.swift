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
    
    
    
    var currentPlayerIndex = 0
    var isGettingOutOfPenaltyBox = false
    
    public init(){
        for i in 0..<50 {
            QuestionsData.popQuestions.append("Pop Question \(i)")
            QuestionsData.scienceQuestions.append(("Science Question \(i)"))
            QuestionsData.sportsQuestions.append(("Sports Question \(i)"))
            QuestionsData.rockQuestions.append(createRockQuestion(index: i))
        }
    }
    
    private func createRockQuestion(index: Int) -> String{
        return "Rock Question \(index)"
    }
    
    private func isPlayable() -> Bool {
        return players.count <= 6 && players.count >= 2
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
    
    
    // MARK: Starting game
    fileprivate func checkAndUpdatePlace() {
        if places[currentPlayerIndex] > 11 {
            places[currentPlayerIndex] -= 12
        }
    }
    
    private func canGetOutOfPenalety(_ roll: Int) {
        if roll % 2 != 0 {
            isGettingOutOfPenaltyBox = true
            
            print(players[currentPlayerIndex], "is getting out of the penalty box")
            places[currentPlayerIndex] += roll
            
            checkAndUpdatePlace()
            
            print(players[currentPlayerIndex]
                  + "'s new location is",
                  places[currentPlayerIndex])
            
            print("The category is", QuestionsData.currentCategory(placeNom: places[currentPlayerIndex]))
            
            QuestionsData.askQuestion(places[currentPlayerIndex])
        } else {
            print(players[currentPlayerIndex], "is not getting out of the penalty box")
            isGettingOutOfPenaltyBox = false
        }
    }
    
    public func roll(roll: Int) throws {
        
        guard isPlayable() else{
            print("the game must have from 2 to 6 players")
            throw GameError.gameMustHaveMoreThanOnePlayer
            
        }
        
        print(players[currentPlayerIndex], "is the current player")
        print("They have rolled a", roll)
        
        if inPenaltyBox[currentPlayerIndex] {
            canGetOutOfPenalety(roll)
            
        } else {
            
            places[currentPlayerIndex] += roll
            
            checkAndUpdatePlace()
            
            print(players[currentPlayerIndex]
                  + "'s new location is",
                  places[currentPlayerIndex])
            print("The category is", QuestionsData.currentCategory(placeNom: places[currentPlayerIndex]))
            
            QuestionsData.askQuestion(places[currentPlayerIndex])
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
            purses[currentPlayerIndex] += 1
            print(players[currentPlayerIndex],
                  "now has",
                  purses[currentPlayerIndex],
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
        if inPenaltyBox[currentPlayerIndex]{
            return gettingOut()
            
        } else {
            
            print("Answer was correct!!!!")
            purses[currentPlayerIndex] += 1
            print(players[currentPlayerIndex],
                  "now has",
                  purses[currentPlayerIndex],
                  "Gold Coins.")
            
            
            moveToNextPlayer()
            
            return didPlayerWin
        }
    }
    
    public func wrongAnswer()->Bool{
        print("Question was incorrectly answered")
        print(players[currentPlayerIndex], "was sent to the penalty box")
        inPenaltyBox[currentPlayerIndex] = true
        
        moveToNextPlayer()
        return true
    }
    
    
    // MARK: Did win
    private var didPlayerWin: Bool {
        return !(purses[currentPlayerIndex] == 6)
    }
}

enum GameError: Error{
    case gameMustHaveMoreThanOnePlayer
}

class QuestionsData{
    
    static var popQuestions = [String]()
    static var scienceQuestions = [String]()
    static var sportsQuestions = [String]()
    static var rockQuestions = [String]()
    
    static func dequeueQuestionThenEnqueueQuestionAgain(questionsList: inout [String]){
        
        if questionsList.count > 0{
            let removedQuestion = questionsList.removeFirst()
            questionsList.append(removedQuestion)
            print(removedQuestion)
        }
        
    }
    
    static func askQuestion(_ placeNom: Int) {
        if QuestionsData.currentCategory(placeNom: placeNom) == .Pop {
            dequeueQuestionThenEnqueueQuestionAgain(questionsList: &QuestionsData.popQuestions)
        }
        if  QuestionsData.currentCategory(placeNom: placeNom) == .Science{
            dequeueQuestionThenEnqueueQuestionAgain(questionsList: &QuestionsData.popQuestions)
        }
        if  QuestionsData.currentCategory(placeNom: placeNom) == .Sports{
            dequeueQuestionThenEnqueueQuestionAgain(questionsList: &QuestionsData.popQuestions)
        }
        if  QuestionsData.currentCategory(placeNom: placeNom) == .Rock{
            dequeueQuestionThenEnqueueQuestionAgain(questionsList: &QuestionsData.popQuestions)
        }
    }

    static func currentCategory(placeNom: Int) -> QuestionCategory{

        if placeNom == 0 || placeNom == 4 || placeNom == 0{
            return .Pop
        }else if placeNom == 1 || placeNom == 5 || placeNom == 9{
            return .Science
        }else if placeNom == 2 || placeNom == 6 || placeNom == 10{
            return .Sports
        }else{
            return .Rock
        }
    }

    enum QuestionCategory: String{
        case Pop
        case Science
        case Sports
        case Rock
    }

}
