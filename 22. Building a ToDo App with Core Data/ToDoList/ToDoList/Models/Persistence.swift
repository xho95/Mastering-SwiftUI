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

// Just for the Preview
extension PersistenceController {
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for index in 0..<10 {
            let newItem = ToDoItem(context: viewContext)
            newItem.id = UUID()
            newItem.name = "To do item #\(index)"
            newItem.priority = .normal
            newItem.isComplete = false
        }
        
        do {
            try viewContext.save()
        } catch {
            //
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }()
}

