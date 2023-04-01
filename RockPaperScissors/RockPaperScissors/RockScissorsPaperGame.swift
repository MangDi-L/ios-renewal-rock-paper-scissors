//
//  RockScissorsPaperGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

struct RockScissorsPaperGame: InputFilterable {
    var isGameOver: Bool = false

    mutating func startGame() {
        while isGameOver == false {
            print(GameGuideWords.startRockPaperScissorGame.rawValue, terminator: " ")

            guard let userInput = filterUserInput() else { continue }
            
            if userInput == 0 {
                print("게임 종료")
                return
            }
            
            decideWhoStartsFirstTurn(with: userInput)
        }
    }

    mutating func decideWhoStartsFirstTurn(with userChoice: Int) {
        let computerPick = RockScissorsPaper.allCases.randomElement()
        let userPick = RockScissorsPaper(rawValue: userChoice)
        let comparisonOfTwoPicks = (computerPick, userPick)
        let mcbGame = MukChiBbaGame()
        
        if computerPick == userPick {
            print(GameGuideWords.tie.rawValue)
            isGameOver = false
            return
        }
        
        switch comparisonOfTwoPicks {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print(GameGuideWords.win.rawValue)
            mcbGame.startMukChiBbaGame(turn: Player.user)
        default:
            print(GameGuideWords.loss.rawValue)
            mcbGame.startMukChiBbaGame(turn: Player.computer)
        }
        isGameOver = true
    }
}

