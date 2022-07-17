//
//  Guess.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

class Guess: ObservableObject {
	
	@Published var colors = [Color](repeating: Color.silver, count: 4)
	let index: Int
	
	init(index: Int) {
		self.index = index
	}
}
