//
//  GameDataModel.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class GameDataModel: ObservableObject {
	
	@Published var guesses: [Guess] = []
	
	static var turn = 0
	var beadsFilled = 0
	
	init() {
		newGame()
	}
	
	func newGame() {
		populateDefaults()
	}
	
	func populateDefaults() {
		guesses = []
		
		for index in 0...11 {
			guesses.append(Guess(index: index))
		}
	}

	
	func addData(color: Color) {
		if beadsFilled <= 3 {
			beadsFilled += 1
		} else {
			GameDataModel.turn += 1
			beadsFilled = 1
		}
		
		guesses[GameDataModel.turn].colors[beadsFilled - 1] = color
		print(color)
		print(guesses[GameDataModel.turn].colors)
	}
	
	func backspacePressed() {
		if beadsFilled >= 1 && beadsFilled < 4 {
			guesses[GameDataModel.turn].colors[beadsFilled - 1] = Color.silver
		}
		print(guesses[GameDataModel.turn].colors)
	}
}
