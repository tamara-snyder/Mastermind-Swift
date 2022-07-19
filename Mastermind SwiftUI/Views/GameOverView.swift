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
			Color.background
				.ignoresSafeArea()
			
			VStack {
				Text("GAME OVER")
					.foregroundColor(Color.white)
					.font(.largeTitle)
					.padding()
				Text("\(gameData.getResult())")
					.foregroundColor(Color.white)
					.font(.title)
					.padding()
					.padding()
				Button("Play again") {
					gameData.gameOver = false
					gameData.newGame()
				}
				.padding()
				.foregroundColor(Color.white)
				.background(Color.purple)
				.font(.title)
			}
		}
	}
}
