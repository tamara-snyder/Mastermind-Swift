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
				HStack {
//					ForEach(0...3, id: \.self) { index in
//						Circle().fill(guess.colors[index])
//					}
					Circle().fill(Color(K.Colors.silver))
					Circle().fill(Color(K.Colors.silver))
					Circle().fill(Color(K.Colors.silver))
					Circle().fill(Color(K.Colors.silver))
				}
				
				VStack(spacing: 10) {
					HStack {
						Circle().fill(Color(K.Colors.silver))
						Circle().fill(Color(K.Colors.silver))
					}
					HStack {
						Circle().fill(Color(K.Colors.silver))
						Circle().fill(Color(K.Colors.silver))
					}
				}
				.aspectRatio(1, contentMode: .fit)
			}
			.padding(.horizontal)
			.frame(maxHeight: 50)
			
			Divider().background(Color(K.Colors.gray))
			
		}
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}
