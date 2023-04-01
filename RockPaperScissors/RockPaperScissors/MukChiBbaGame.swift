//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

struct MukChiBbaGame: InputFilterable {
    var isGameOver: Bool = false
    var attacker: Player = .user

    mutating func startMukChiBbaGame(turn: Player) {
        attacker = turn
        
        while isGameOver == false {
            print("[\(attacker.rawValue) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            guard let userInput = filterUserInput() else {
                attacker = .computer
                continue
            }

            switch userInput {
            case 0:
                print(GameGuideWords.gameOver.rawValue)
                isGameOver = true
            default:
                decideWinner(userInput: userInput, turn: attacker)
            }
        }
    }
    
    mutating func decideWinner(userInput: Int, turn: Player) {
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
            attacker = Player.user
        default:
            attacker = Player.computer
        }
        print("\(attacker.rawValue)의 턴입니다")
    }
}
