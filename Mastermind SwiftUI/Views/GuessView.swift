//
//  GuessView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct GuessView: View {
	
	@EnvironmentObject var gameBrain: GameDataModel
	@Binding var guess: Guess
	
    var body: some View {
		HStack {
//			ForEach(0...3, id: \.self) { index in
//				let currentColor = gameBrain.guesses[GameDataModel.turn].colors[index]
//				Circle().fill(currentColor)
//				Circle().fill($guess.guesses[GameDataModel.turn].colors[index])
//			}
			
			ForEach(0...3, id: \.self) { index in
				Circle().fill(guess.colors[index])
			}
			
		}
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
		GuessView(guess: .constant(Guess(index: 0)))
    }
}
