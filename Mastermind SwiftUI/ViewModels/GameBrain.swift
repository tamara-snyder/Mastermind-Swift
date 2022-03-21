//
//  GameBrain.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import Foundation

class GameBrain: ObservableObject {
	
	static var turn = 0
	var beadsFilled = 0
	var gameData = Array(repeating: [], count: 12)
	
	func addData(color: String) {
		if beadsFilled <= 3 {
			beadsFilled += 1
		} else {
			GameBrain.turn += 1
			beadsFilled = 0
		}
		
		gameData[GameBrain.turn].append(color)
		print(color)
		print(gameData)
	}
	
	func backspacePressed() {
		if beadsFilled >= 1 && beadsFilled < 4 {
			gameData[GameBrain.turn].removeLast()
		}
		print(gameData)
	}
}
