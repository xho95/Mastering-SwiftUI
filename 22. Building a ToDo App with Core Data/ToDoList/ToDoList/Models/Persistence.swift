//
//  Persistence.swift
//  ToDoList
//
//  Created by Kim, Min Ho on 2021/05/03.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ToDoList")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                //
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

