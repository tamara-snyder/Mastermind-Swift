//
//  Mastermind_SwiftUIApp.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/17/22.
//

import SwiftUI

@main
struct Mastermind: App {
	@StateObject var gameData = GameDataModel()
	
    var body: some Scene {
        WindowGroup {
			GameView()
				.environmentObject(gameData)
        }
    }
}
