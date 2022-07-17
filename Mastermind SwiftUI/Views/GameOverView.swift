//
//  GameOver.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/17/22.
//

import SwiftUI

struct GameOverView: View {
	@ObservedObject var gameData: GameDataModel
	
	var body: some View {
		ZStack {
			Color.gray
				.ignoresSafeArea()
			
			VStack {
				Text("Game over. \(gameData.getResult())")
					.foregroundColor(Color.white)
					.font(.title)
					.padding()
				Button("Play again") {
					gameData.gameOver = false
					gameData.newGame()
				}
				.cornerRadius(16)
				.padding()
				.foregroundColor(Color.white)
				.background(Color.blue)
				.font(.title)
			}
		}
	}
}
