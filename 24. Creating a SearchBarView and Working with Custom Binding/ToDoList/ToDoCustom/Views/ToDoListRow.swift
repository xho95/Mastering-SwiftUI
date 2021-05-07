//
//  ToDoListRow.swift
//  ToDoCustom
//
//  Created by Kim, Min Ho on 2021/05/07.
//

import SwiftUI

struct ToDoListRow: View {
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var todoItem: ToDoItem
    
    var body: some View {
        Toggle(isOn: self.$todoItem.isComplete) {
            HStack {
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                
                Spacer()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(self.color(for: self.todoItem.priority))
            }
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(todoItem.objectWillChange, perform: { _ in
            if self.context.hasChanges {
                try? self.context.save()
            }
        })

    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListRow(todoItem: ToDoItem())
    }
}
