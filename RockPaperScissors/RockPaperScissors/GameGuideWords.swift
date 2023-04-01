//
//  GameGuideWords.swift
//  RockPaperScissors
//
//  Created by Mangdi on 2023/04/01.
//

import Foundation

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
