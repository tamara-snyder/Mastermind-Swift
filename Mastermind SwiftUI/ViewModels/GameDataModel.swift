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
	
	private var secretCode: [Color] = []
	private var turnsRemaining = 11
	private var beadsFilled = 0
	private var gameOver = false
	
	init() {
		newGame()
	}
	
	func newGame() {
		guesses = []
		feedback = []
		secretCode = makeSecretCode()
		
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
			getFeedback()
		}
	}
	
	func backspacePressed() {
		if beadsFilled > 0 && beadsFilled < 4 && turnsRemaining <= 12 {
			beadsFilled -= 1
			guesses[turnsRemaining].colors[beadsFilled] = Color.silver
		}
	}
	
	func getFeedback() {
		let currentGuess: Array = guesses[turnsRemaining].colors
		var currentFeedback: Array = feedback[turnsRemaining].colors
		
		for i in 0..<currentGuess.count {
			print("Guess: \(currentGuess)")
			print("Secret Code: \(secretCode)")
			print(secretCode.contains(currentGuess[i]))
			if secretCode.contains(currentGuess[i]) {
				print("\(i): \(currentGuess[i] == secretCode[i])")
				if currentGuess[i] == secretCode[i] {
					currentFeedback[i] = Color.red
				} else {
					currentFeedback[i] = Color.white
				}
			}
		}
		
		feedback[turnsRemaining].colors = currentFeedback
		print(feedback[turnsRemaining].colors)
	}
}
