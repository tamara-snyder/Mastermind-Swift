//
//  GameDataModel.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class GameDataModel: ObservableObject {
	
	@Published var guesses: [Guess] = []
	
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
}
