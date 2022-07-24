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
			VStack {
				Text("Game Menu")
					.font(.largeTitle)
					.foregroundColor(Color.silver)
					.padding()
				Spacer()
				Button("New Game") {
					gameData.newGame()
					gameData.showingGameMenu = false
				}
				.padding()
				.frame(width: 250, height: 70, alignment: .center)
				.font(.title2)
				.foregroundColor(Color.white)
				.background(Color.purple)
				.cornerRadius(15)
			}
		}
	}
}
