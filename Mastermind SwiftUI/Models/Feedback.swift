//
//  Feedback.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/17/22.
//

import SwiftUI

class Feedback: ObservableObject {
	@Published var colors = [Color](repeating: Color.red, count: 4)
	let index: Int
	
	init(index: Int) {
		self.index = index
	}
}
