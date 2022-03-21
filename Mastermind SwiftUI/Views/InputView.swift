//
//  InputView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/21/22.
//

import SwiftUI

struct InputView: View {
	
	@ObservedObject var gameBrain = GameBrain()
	
    var body: some View {
		
		
		HStack {

			Circle().fill(Color(K.Colors.red))
				.onTapGesture {
					gameBrain.addData(color: "red")
				}
			Circle().fill(Color(K.Colors.orange))
				.onTapGesture {
					gameBrain.addData(color: "orange")
				}
			Circle().fill(Color(K.Colors.yellow))
				.onTapGesture {
					gameBrain.addData(color: "yellow")
				}
			Circle().fill(Color(K.Colors.green))
				.onTapGesture {
					gameBrain.addData(color: "green")
				}
			Circle().fill(Color(K.Colors.blue))
				.onTapGesture {
					gameBrain.addData(color: "blue")
				}
			Circle().fill(Color(K.Colors.purple))
				.onTapGesture {
					gameBrain.addData(color: "purple")
				}
			
			Divider().background(Color(K.Colors.gray))
			
	
			Image(systemName: "delete.backward.fill")
				.foregroundColor(Color(K.Colors.gray))
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