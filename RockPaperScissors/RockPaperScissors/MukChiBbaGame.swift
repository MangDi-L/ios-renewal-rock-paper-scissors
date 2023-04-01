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
        guard let computerPick = RockScissorsPaper.allCases.randomElement(),
              let userPick = RockScissorsPaper(rawValue: userInput) else { return }
        
        if computerPick == userPick {
            print("\(turn.rawValue)의 승리!")
            isGameOver = true
        } else {
            decideWhoseTurn((computerPick, userPick))
        }
    }
    
    mutating func decideWhoseTurn(_ comparisonOfTwoPicks: (RockScissorsPaper, RockScissorsPaper)) {
        switch comparisonOfTwoPicks {
        case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
            turn = Player.user
        default:
            turn = Player.computer
        }
        print("\(turn.rawValue)의 턴입니다")
    }
}
