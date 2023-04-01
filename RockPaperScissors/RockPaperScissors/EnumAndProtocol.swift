//
//  CommonFunctions.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

enum GameGuideWords: String {
    case startRockPaperScissorGame = "가위(1), 바위(2), 보(3)!<종료: 0> :"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case gameOver = "게임 종료"
    case win = "이겼습니다!"
    case loss = "졌습니다!"
    case tie = "비겼습니다!"
    case computerTurn = "컴퓨터의 턴입니다."
    case userTurn = "사용자의 턴입니다."
}

enum Player: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

enum RockScissorsPaper: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

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
