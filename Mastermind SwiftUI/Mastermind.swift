//
//  Mastermind_SwiftUIApp.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 3/17/22.
//

import SwiftUI

@main
struct Mastermind: App {
	@StateObject private var dataController = DataController()
	@StateObject var gameData = GameDataModel()
	
    var body: some Scene {
        WindowGroup {
			GameView(gameData: gameData)
				.environment(\.managedObjectContext, dataController.container.viewContext)
				.popover(isPresented: $gameData.gameOver) {
					GameOverView(gameData: gameData)
				}
        }
    }
}
