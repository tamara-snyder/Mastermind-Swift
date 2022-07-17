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
				ForEach(0..<12) { i in
					RowView(gameBrain: self.gameBrain.guesses[i])
				}
				
				Group {
					ForEach(0..<4) { _ in
						Spacer()
					}
					
					InputView(gameBrain: gameBrain)
					
					ForEach(0..<4) { _ in
						Spacer()
					}
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
