//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

@main
struct NotesAppApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NotesView().environment(\.managedObjectContext,persistentController.container.viewContext)
        }
    }
}
