//
//  BudgetTrackerNewApp.swift
//  BudgetTrackerNew
//
//  Created by admin on 30/01/25.
//

import SwiftUI

@main
struct BudgetTrackerNewApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext,persistentController.container.viewContext)
        }
    }
}
