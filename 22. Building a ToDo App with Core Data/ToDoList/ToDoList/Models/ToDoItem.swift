//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Simon Ng on 31/8/2020.
//

import Foundation
import CoreData

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}

// The model class of Core Data should be inherited from NSManagedObject
public class ToDoItem: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var isComplete: Bool
}

extension ToDoItem: Identifiable {
    var priority: Priority {    // To transform the priority from enum to Int32
        get {
            Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        
        set {
            priorityNum = Int32(newValue.rawValue)
        }
    }
}

/*
// ToDoItem might be the @StateObject
class ToDoItem: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String = ""
    @Published var priority: Priority = .normal
    @Published var isComplete: Bool = false
    
    init(name: String, priority: Priority = .normal, isComplete: Bool = false) {
        self.name = name
        self.priority = priority
        self.isComplete = isComplete
    }
}
*/

