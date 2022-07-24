//
//  DataController.swift
//  Mastermind SwiftUI
//
//  Created by Tamara Snyder on 7/24/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "DataModel")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
