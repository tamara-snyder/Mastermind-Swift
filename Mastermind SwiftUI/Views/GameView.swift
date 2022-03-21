//
//  ContentView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/17/22.
//

import SwiftUI

struct GameView: View {
	
    var body: some View {
		ZStack {
			Color.background.ignoresSafeArea()
			VStack {
				Group {
					RowView()
					RowView()
					RowView()
					RowView()
					RowView()
					RowView()
				}
				
				Group {
					RowView()
					RowView()
					RowView()
					RowView()
					RowView()
					RowView()
				}
				
				Group {
					Spacer()
					Spacer()
					Spacer()
					Spacer()
					
					InputView(gameBrain: GameDataModel())
					
					Spacer()
					Spacer()
					Spacer()
					Spacer()
				}
			}
			.frame(maxWidth: 500, maxHeight: 1000)
		}
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
