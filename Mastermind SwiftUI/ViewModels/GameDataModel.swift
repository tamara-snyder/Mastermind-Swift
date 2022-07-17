//
//  GameDataModel.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class GameDataModel: ObservableObject {
	
	@Published var guesses: [Guess] = []
	
	private var turnsRemaining = 11
	private var beadsFilled = 0
	private var gameOver = false
	
	init() {
		newGame()
	}
	
	func newGame() {
		guesses = []
		
		for index in 0...turnsRemaining {
			guesses.append(Guess(index: index))
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
			print(guesses[turnsRemaining].colors)
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
