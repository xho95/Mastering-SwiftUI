//
//  FilteredList.swift
//  ToDoSearch
//
//  Created by Kim, Min Ho on 2021/05/07.
//

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var searchText: String
    
    var fetchRequest: FetchRequest<ToDoItem>
    var todoItems: FetchedResults<ToDoItem> {
        fetchRequest.wrappedValue
    }
    
    /// creates a dynamic fetch request
    init(_ searchText: Binding<String>) {
        self._searchText = searchText   // To assgin a binding, use the underscore
        
        let predicate = searchText.wrappedValue.isEmpty ?
            NSPredicate(value: true) :
            NSPredicate(format: "name CONTAINS[c] %@", searchText.wrappedValue)

        self.fetchRequest = FetchRequest(
            entity: ToDoItem.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.priorityNum, ascending: false)],
            predicate: predicate,
            animation: .default)
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(todoItems) { todoItem in
                    ToDoListRow(todoItem: todoItem)
                }
                .onDelete(perform: deleteTask)
            }
            
            // If there is no data, show an empty view
            if todoItems.count == 0 {
                NoDataView()
            }
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let itemToDelete = todoItems[index]
            context.delete(itemToDelete)
        }

        DispatchQueue.main.async {
            do {
                try context.save()
                
            } catch {
                print(error)
            }
        }
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(.constant(""))
    }
}
