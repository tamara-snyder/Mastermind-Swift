//
//  InputView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct InputView: View {
	
	@ObservedObject var gameData: GameDataModel
	
    var body: some View {
		
		HStack {
			Circle().fill(Color.red)
				.onTapGesture {
					gameData.addData(color: Color.red)
				}
			Circle().fill(Color.orange)
				.onTapGesture {
					gameData.addData(color: Color.orange)
				}
			Circle().fill(Color.yellow)
				.onTapGesture {
					gameData.addData(color: Color.yellow)
				}
			Circle().fill(Color.green)
				.onTapGesture {
					gameData.addData(color: Color.green)
				}
			Circle().fill(Color.blue)
				.onTapGesture {
					gameData.addData(color: Color.blue)
				}
			Circle().fill(Color.purple)
				.onTapGesture {
					gameData.addData(color: Color.purple)
				}
			
			Divider().background(Color.gray)
			
	
			Image(systemName: "delete.backward.fill")
				.foregroundColor(Color.gray)
				.font(.system(size: 32))
				.onTapGesture {
					gameData.backspacePressed()
				}
			
		}
		.padding(.horizontal)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
		InputView(gameData: GameDataModel())
    }
}
