//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

struct MukChiBbaGame: InputFilterable {
    var isGameOver: Bool = false
    var turn: Player = .user

    mutating func startMukChiBbaGame(startTurn: Player) {
        turn = startTurn
        
        while isGameOver == false {
            print("[\(turn.rawValue) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            guard let userInput = filterUserInput() else {
                turn = .computer
                continue
            }

            switch userInput {
            case 0:
                print(GameGuideWords.gameOver.rawValue)
                isGameOver = true
            default:
                decideWinner(userInput: userInput)
            }
        }
    }
    
    mutating func decideWinner(userInput: Int) {
        guard let computerHand = RockScissorsPaper.allCases.randomElement(),
              let userHand = RockScissorsPaper(rawValue: userInput) else { return }
        
        if computerHand == userHand {
            print("\(turn.rawValue)의 승리!")
            isGameOver = true
        } else {
            decideWhoseTurn((computerHand, userHand))
        }
    }
    
    mutating func decideWhoseTurn(_ comparisonOfTwoHands: (RockScissorsPaper, RockScissorsPaper)) {
        switch comparisonOfTwoHands {
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            turn = Player.user
        default:
            turn = Player.computer
        }
        print("\(turn.rawValue)의 턴입니다")
    }
}
