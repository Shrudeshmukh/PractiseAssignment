//
//  PersistenceController.swift
//  BudgetTracker
//
//  Created by admin on 29/01/25.
//

import CoreData

struct PersistenceController{
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false){
        container=NSPersistentContainer(name: "BudgetTrackerdb")
        if inMemory{
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores{_,error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        }
    }
    func saveContent(){
        let context = container.viewContext
        if context.hasChanges{
            try? context.save()
        }
    }
    
}
