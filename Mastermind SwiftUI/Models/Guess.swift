//
//  Guess.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct Guess {
	
	let index: Int
	var colors = [Color](repeating: Color.silver, count: 4)
}
