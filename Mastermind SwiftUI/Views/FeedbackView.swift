//
//  FeedbackView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
		VStack(spacing: 10) {
			HStack {
				Circle().fill(Color.silver)
				Circle().fill(Color.silver)
			}
			HStack {
				Circle().fill(Color.silver)
				Circle().fill(Color.silver)
			}
		}
		.aspectRatio(1, contentMode: .fit)
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
