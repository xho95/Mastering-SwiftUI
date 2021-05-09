//
//  Persistence.swift
//  PFinance
//
//  Created by Simon Ng on 11/9/2020.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for index in 0..<10 {
            let newItem = PaymentActivity(context: viewContext)
            newItem.paymentId = UUID()
            newItem.name = "Flight ticket #\(index)"
            newItem.type = index % 2 == 0 ? .income : .expense
            newItem.address = "Crawford House, 70 Queen's Road Central, Hong Kong"
            newItem.amount = 320.0
            newItem.date = .today
            newItem.memo = "Just hope that I can travel again later this year"
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PFinanceStore")
        if inMemory {
            let url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions.first!.url = url
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
