//
//  GameDataModel.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class GameDataModel: ObservableObject {
	@Published var guesses: [Guess] = []
	@Published var feedback: [Feedback] = []
	@Published var gameOver = false
	private var secretCode: [Color] = []
	private var turnsRemaining = 11
	private var beadsFilled = 0
	
	init() {
		newGame()
	}
	
	func newGame() {
		guesses = []
		feedback = []
		gameOver = false
		secretCode = makeSecretCode()
		turnsRemaining = 11
		beadsFilled = 0
		
		for index in 0...turnsRemaining {
			guesses.append(Guess(index: index))
			feedback.append(Feedback(index: index))
		}
		
		print("Secret code: \(secretCode)")
	}
	
	func makeSecretCode() -> [Color] {
		var code: [Color] = []
		
		for _ in 0...3 {
			code.append(Color.colorOptions.randomElement() ?? Color.silver)
		}
		
		return code
	}
	
	func addData(color: Color) {
		if beadsFilled <= 3 {
			beadsFilled += 1
		} else {
			turnsRemaining -= 1
			beadsFilled = 1
		}
		
		if turnsRemaining >= 0 {
			guesses[turnsRemaining].colors[beadsFilled - 1] = color
		} else {
			gameOver = true
		}
		
		if beadsFilled == 4 {
			endTurn()
		}
	}
	
	func backspacePressed() {
		if beadsFilled > 0 && beadsFilled < 4 && turnsRemaining <= 12 {
			beadsFilled -= 1
			guesses[turnsRemaining].colors[beadsFilled] = Color.silver
		}
	}
	
	func endTurn() {
		getFeedback()
		checkGameOver()
	}
	
	func getFeedback() {
		let currentGuess: Array = guesses[turnsRemaining].colors
		var currentFeedback: [Color] = []
		var secretCodeCopy = secretCode
		
		for i in 0..<currentGuess.count {
			if currentGuess[i] == secretCode[i] {
				currentFeedback.insert(Color.red, at: 0)
			} else if secretCodeCopy.contains(currentGuess[i]) {
				currentFeedback.append(Color.white)
			} else {
				currentFeedback.append(Color.black)
			}
			secretCodeCopy[i] = Color.black
		}
		
		feedback[turnsRemaining].colors = currentFeedback
	}
	
	func checkGameOver() {
		if turnsRemaining == 0 || guesses[turnsRemaining].colors == secretCode {
			gameOver = true
		}
	}
	
	func getResult() -> String {
		if guesses[turnsRemaining].colors == secretCode {
			return "You win!"
		} else if turnsRemaining == 0 {
			return "You lose."
		} else {
			return ""
		}
	}
}
