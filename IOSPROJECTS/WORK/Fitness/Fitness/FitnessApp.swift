//
//  FitnessApp.swift
//  Fitness
//
//  Created by admin on 04/02/25.
//

import SwiftUI

@main
struct FitnessApp: App {
    
    let persistentController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            WorkoutView().environment(\.managedObjectContext,persistentController.container.viewContext)
        }
    }
}
