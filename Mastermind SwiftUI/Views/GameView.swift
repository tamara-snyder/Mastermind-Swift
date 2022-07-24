//
//  ContentView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/17/22.
//

import SwiftUI

struct GameView: View {
	
	@ObservedObject var gameData: GameDataModel
	
    var body: some View {
		ZStack {
			Color.background.ignoresSafeArea()
			VStack {
				HStack {
					Button {
						gameData.showingGameMenu = true
					} label: {
						Image(systemName: "gear")
							.font(.system(size: 25))
							.foregroundColor(Color.silver)
					}
					Text("MASTERMIND")
						.font(.title)
						.fontWeight(.heavy)
						.foregroundColor(Color.silver)
						.lineLimit(nil)
						.padding(.horizontal)
					Button {
						gameData.showingGameMenu = true
					} label: {
						Image(systemName: "chart.bar.xaxis")
							.font(.system(size: 25))
							.foregroundColor(Color.silver)
					}
					.popover(isPresented: $gameData.showingGameMenu) {
						GameMenuView(gameData: gameData)
					}
						
				}
				
				ForEach(0..<12) { i in
					RowView(guess: self.gameData.guesses[i], feedback: self.gameData.feedback[i])
				}
				
				ForEach(0..<4) { _ in
					Spacer()
				}
				
				InputView(gameData: gameData)
				
				ForEach(0..<4) { _ in
					Spacer()
				}
			}
			.frame(maxWidth: 500, maxHeight: 1000)
		}
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
		GameView(gameData: GameDataModel())
    }
}
