//
//  SettingsMenuView.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/24/22.
//

import SwiftUI

struct SettingsMenuView: View {
	
	@ObservedObject var gameData: GameDataModel
	
	var body: some View {
		ZStack {
			Color.background
				.ignoresSafeArea()
			VStack {
				Text("Settings")
					.font(.largeTitle)
					.foregroundColor(Color.silver)
					.padding()
				Spacer()
			}
		}
	}
}

