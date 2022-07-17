//
//  RowView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct RowView: View {
	
	var guess: Guess
	var feedback: Feedback
	
    var body: some View {
		VStack {
			HStack(spacing: 40) {
				GuessView(guess: guess)
				
				FeedbackView(feedback: feedback)
			}
			.padding(.horizontal)
			.frame(maxHeight: 50)
			
			Divider().background(Color.gray)
			
		}
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
		RowView(guess: Guess(index: 0), feedback: Feedback(index: 0))
    }
}
