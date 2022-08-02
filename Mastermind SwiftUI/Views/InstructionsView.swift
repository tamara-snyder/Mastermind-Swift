//
//  SettingsMenuView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/24/22.
//

import SwiftUI

struct InstructionsView: View {
	
	@ObservedObject var gameData: GameDataModel
	
	var body: some View {
		ZStack {
			Color.background
				.ignoresSafeArea()
			VStack(spacing: 10) {
				Text("How to Play")
					.font(.largeTitle)
					.foregroundColor(Color.silver)
				
				Text("The computer has chosen a random sequence of four beads. Your job is to guess the secret code in less than 12 tries.")
					.padding()
					.font(.title2)
					.multilineTextAlignment(.center)
				
					Text("There are six possible colors you can choose from, and any color can occur more than once in the secret code:")
					HStack {
						Circle().fill(Color.red)
							.frame(width: 20, height: 20)
						Circle().fill(Color.orange)
							.frame(width: 20, height: 20)
						Circle().fill(Color.yellow)
							.frame(width: 20, height: 20)
						Circle().fill(Color.green)
							.frame(width: 20, height: 20)
						Circle().fill(Color.blue)
							.frame(width: 20, height: 20)
						Circle().fill(Color.purple)
							.frame(width: 20, height: 20)
					}
					.padding(.horizontal, 50)
					Text("Once you select a sequence of four beads, you will receive feedback:")
					VStack(spacing: 10) {
						HStack {
							Circle().fill(Color.red)
								.frame(width: 15, height: 15)
							Circle().fill(Color.red)
								.frame(width: 15, height: 15)
						}
						HStack {
							Circle().fill(Color.white)
								.frame(width: 15, height: 15)
							Circle().fill(Color.black)
								.frame(width: 15, height: 15)
						}
					}
					.aspectRatio(1, contentMode: .fit)
				
					Text("A red pin means that some bead was both the correct color and in the right spot.")
					Text("A white pin means that some bead was the correct color, but it was in the wrong spot.")
					Text("A black (empty) spot means that some bead was incorrect in both color and placement.")
					Text("Feedback goes in order from red to white to black pins. It does not necessarily correspond with the order of the sequence you entered.")
			}
			.foregroundColor(Color.silver)
			.padding()
			.fixedSize(horizontal: false, vertical: true)
			.multilineTextAlignment(.center)
		}
	}
}

