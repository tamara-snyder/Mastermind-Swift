//
//  InputView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct InputView: View {
	
	@EnvironmentObject var gameBrain: GameDataModel
	
	// @ObservedObject var gameBrain = GameBrain()
	
    var body: some View {
		
		
		HStack {

			Circle().fill(Color.red)
				.onTapGesture {
					gameBrain.addData(color: Color.red)
				}
			Circle().fill(Color.orange)
				.onTapGesture {
					gameBrain.addData(color: Color.orange)
				}
			Circle().fill(Color.yellow)
				.onTapGesture {
					gameBrain.addData(color: Color.yellow)
				}
			Circle().fill(Color.green)
				.onTapGesture {
					gameBrain.addData(color: Color.green)
				}
			Circle().fill(Color.blue)
				.onTapGesture {
					gameBrain.addData(color: Color.blue)
				}
			Circle().fill(Color.purple)
				.onTapGesture {
					gameBrain.addData(color: Color.purple)
				}
			
			Divider().background(Color.gray)
			
	
			Image(systemName: "delete.backward.fill")
				.foregroundColor(Color.gray)
				.font(.system(size: 32))
				.onTapGesture {
					gameBrain.backspacePressed()
				}
			
		}
		.padding(.horizontal)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
		InputView()
    }
}
