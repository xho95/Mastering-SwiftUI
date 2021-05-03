//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Kim, Min Ho on 2021/05/03.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
