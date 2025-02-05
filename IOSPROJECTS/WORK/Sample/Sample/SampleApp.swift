//
//  SampleApp.swift
//  Sample
//
//  Created by admin on 28/01/25.
//

import SwiftUI

@main
struct SampleApp: App {
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            PostsView()
                .environment(\.managedObjectContext,persistentController.container.viewContext )
        }
    }
}
