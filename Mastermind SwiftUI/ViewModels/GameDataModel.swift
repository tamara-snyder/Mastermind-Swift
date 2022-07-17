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
	
	private var turnsRemaining = 11
	private var beadsFilled = 0
	private var gameOver = false
	private var secretCode: [Color] = []
	
	init() {
		newGame()
	}
	
	func newGame() {
		guesses = []
		feedback = []
		secretCode = []
		
		for index in 0...turnsRemaining {
			guesses.append(Guess(index: index))
			feedback.append(Feedback(index: index))
		}
		
		makeSecretCode()
	}
	
	func makeSecretCode() {
		for _ in 0...3 {
			secretCode.append(Color.colorOptions.randomElement() ?? Color.silver)
		}
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
	}
	
	func backspacePressed() {
		if beadsFilled > 0 && beadsFilled < 4 && turnsRemaining <= 12 {
			beadsFilled -= 1
			guesses[turnsRemaining].colors[beadsFilled] = Color.silver
		}
	}
}
