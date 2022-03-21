//
//  RowView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct RowView: View {
	
	@EnvironmentObject var dm: GameDataModel
	
    var body: some View {
		VStack {
			HStack(spacing: 40) {
				GuessView(guess: $dm.guesses[GameBrain.turn])
				
				FeedbackView()
			}
			.padding(.horizontal)
			.frame(maxHeight: 50)
			
			Divider().background(Color.gray)
			
		}
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
		RowView()
			.environmentObject(GameDataModel())
    }
}
