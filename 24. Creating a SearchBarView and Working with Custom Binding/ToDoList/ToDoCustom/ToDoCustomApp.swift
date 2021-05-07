//
//  ToDoCustomApp.swift
//  ToDoList
//
//  Created by Simon Ng on 31/8/2020.
//

import SwiftUI

@main
struct ToDoCustomApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
