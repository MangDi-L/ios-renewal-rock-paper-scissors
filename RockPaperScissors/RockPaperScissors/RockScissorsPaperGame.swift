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

            switch userInput {
            case 0:
                print(GameGuideWords.gameOver.rawValue)
                isGameOver = true
            default:
                decideWhoStartsFirstTurn(userInput)
            }
        }
    }

    mutating func decideWhoStartsFirstTurn(_ userInput: Int) {
        guard let userHand = RockScissorsPaper(rawValue: userInput),
              let computerHand = RockScissorsPaper.allCases.randomElement() else { return }
        var mcbGame = MukChiBbaGame()

        switch (userHand, computerHand) {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print(GameGuideWords.loss.rawValue)
            isGameOver = true
            mcbGame.startMukChiBbaGame(startTurn: .computer)
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            print(GameGuideWords.win.rawValue)
            isGameOver = true
            mcbGame.startMukChiBbaGame(startTurn: .user)
        case (_, _):
            print(GameGuideWords.tie.rawValue)
        }
    }
}

