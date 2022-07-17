//
//  GameDataModel.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class GameDataModel: ObservableObject {
	
	@Published var guesses: [Guess] = []
	
	var turn = 0
	var beadsFilled = 0
	
	init() {
		newGame()
	}
	
	func newGame() {
		guesses = []
		
		for index in 0...11 {
			guesses.append(Guess(index: index))
		}
	}
	
	func addData(color: Color) {
		if beadsFilled <= 3 {
			beadsFilled += 1
		} else {
			turn += 1
			beadsFilled = 1
		}
		
		guesses[turn].colors[beadsFilled - 1] = color
		print(guesses[turn].colors)
	}
	
	func backspacePressed() {
		if beadsFilled > 0 {
			beadsFilled -= 1
		}
		
		if beadsFilled >= 0 && beadsFilled < 3 && turn >= 0 {
			guesses[turn].colors[beadsFilled] = Color.silver
			print(beadsFilled)
		} else if beadsFilled == -1 && turn >= 0 {
			turn -= 1
			beadsFilled = 3
			backspacePressed()
		}
	}
}
