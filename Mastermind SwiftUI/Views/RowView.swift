//
//  RowView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct RowView: View {
	
	
    var body: some View {
		VStack {
			HStack(spacing: 40) {
				GuessView(guess: .constant(Guess(index: 0)))
				
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
			.padding(.horizontal)
			.frame(maxHeight: 50)
			
			Divider().background(Color.gray)
			
		}
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
