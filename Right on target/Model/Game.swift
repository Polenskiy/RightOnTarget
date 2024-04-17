//
//  Game.swift
//  Right on target
//
//  Created by Daniil Polenskii on 08.02.2024.
//

import UIKit

protocol GameProtocol {
    
    var score: Int { get }
    
    ///будет отображаться в Label
    var currentSecretValue: Int { get }
    
    ///флаг позволяющий узнать закончилась ли игра
    var isGameEnded: Bool { get }
    
    func restartGame()
    
    func startNewGame()
    
    ///подсчитывает количество очков за раунд
    func calculateScore(with value: Int)
}

protocol getRandomValueProtocol {
    func getNewSecretValue(minSecretValue: Int, maxSecretValue: Int) -> Int
}

///у меня была ошибка до того момента как я не додумался инициализировать значение corrrentRound
class Game: GameProtocol {
    
    var score: Int = 0
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    var currentSecretValue: Int = 0
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    ///вычисляемое свойство
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = getNewSecretValue()
    
    }
    
    func restartGame() {
        score = 0
        currentRound = 0
        startNewGame()
    }
    
    func startNewGame() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    
    ///значение value - это значение со слайдера, т.е которое мы выбрали ползунком
    func calculateScore(with value: Int) {
        if value < currentSecretValue {
            score += 50 - currentSecretValue + value /// 50 - 58 + 50 = 42
        } else if value > currentSecretValue {
            score += 50 - value + currentSecretValue /// 50 + 58 - 50 = 58
        } else {
            score += 50
        }
    }
    
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }

}
class getRandomValue: getRandomValueProtocol {
    func getNewSecretValue(minSecretValue: Int, maxSecretValue: Int) -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}

