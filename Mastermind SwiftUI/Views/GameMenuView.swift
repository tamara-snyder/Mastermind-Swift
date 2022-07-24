//
//  GameMenuView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/24/22.
//

import SwiftUI

struct GameMenuView: View {
	@ObservedObject var gameData: GameDataModel
	
	var body: some View {
		ZStack {
			Color.background
				.ignoresSafeArea()
			Button("New Game") {
				gameData.newGame()
				gameData.showingGameMenu = false
			}
			.foregroundColor(Color.white)
		}
	}
}
