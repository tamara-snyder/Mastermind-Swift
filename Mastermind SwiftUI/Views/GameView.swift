//
//  ContentView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/17/22.
//

import SwiftUI

struct GameView: View {
	
	@ObservedObject var gameBrain: GameDataModel
	
    var body: some View {
		ZStack {
			Color.background.ignoresSafeArea()
			VStack {
				HStack {
					Text("MASTERMIND")
						.font(.title)
						.fontWeight(.heavy)
						.foregroundColor(Color.silver)
						.lineLimit(nil)
						.padding(.horizontal)
				}
				
				ForEach(0..<12) { i in
					RowView(guess: self.gameBrain.guesses[i], feedback: self.gameBrain.feedback[i])
				}
				
				ForEach(0..<4) { _ in
					Spacer()
				}
				
				InputView(gameBrain: gameBrain)
				
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
		GameView(gameBrain: GameDataModel())
    }
}
