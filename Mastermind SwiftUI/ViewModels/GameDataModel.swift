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
	@Published var showingGameMenu = false
	@Published var showingSettingsMenu = false
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
		dataEntryHaptic()
		
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
		var colorCounts: [Color: Int] = [:]
		var redCount = 0
		var whiteCount = 0
		var blackCount = 0
		
		for item in secretCode {
			colorCounts[item] = (colorCounts[item] ?? 0) + 1
		}
		
		for i in 0..<currentGuess.count {
			let countAboveZero = colorCounts[currentGuess[i]] ?? 0 > 0
			
			if currentGuess[i] == secretCode[i] && countAboveZero {
				redCount += 1
				colorCounts[currentGuess[i]]! -= 1
			} else if countAboveZero {
				whiteCount += 1
				colorCounts[currentGuess[i]]! -= 1
			} else {
				blackCount += 1
			}
		}
		
		for _ in 0..<redCount {
			currentFeedback.append(Color.red)
		}
		for _ in 0..<whiteCount {
			currentFeedback.append(Color.white)
		}
		for _ in 0..<blackCount {
			currentFeedback.append(Color.black)
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
	
	func dataEntryHaptic() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
	}
}
