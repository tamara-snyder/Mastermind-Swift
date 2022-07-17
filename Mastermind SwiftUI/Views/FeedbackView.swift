//
//  FeedbackView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct FeedbackView: View {
	
	@ObservedObject var feedback: Feedback
	
    var body: some View {
		VStack(spacing: 10) {
			HStack {
				Circle().fill(feedback.colors[0])
				Circle().fill(feedback.colors[1])
			}
			HStack {
				Circle().fill(feedback.colors[2])
				Circle().fill(feedback.colors[3])
			}
		}
		.aspectRatio(1, contentMode: .fit)
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
		FeedbackView(feedback: Feedback(index: 0))
    }
}
