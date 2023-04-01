//
//  InputFilterable.swift
//  RockPaperScissors
//
//  Created by Mangdi on 2023/04/01.
//

import Foundation

protocol InputFilterable {
    func filterUserInput() -> Int?
}

extension InputFilterable {
    func filterUserInput() -> Int? {
        guard let userInput = readLine()?.replacingOccurrences(of: " ", with: ""),
              let userInput = Int(userInput),
              0...3 ~= userInput else {
            print(GameGuideWords.wrongInput.rawValue)
            return nil
        }
        return userInput
    }
}
