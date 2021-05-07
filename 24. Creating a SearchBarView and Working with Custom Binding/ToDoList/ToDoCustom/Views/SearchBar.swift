//
//  SearchBar.swift
//  ToDoList
//
//  Created by Simon Ng on 1/9/2020.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
    
    private var searchText: Binding<String> {
        Binding<String>(
            get: { self.text.capitalized },
            set: { self.text = $0 }
        )
    }
    
    var body: some View {
        HStack {
            TextField("Search ...", text: searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if self.isEditing {
                            Button {
                                self.text = ""
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if self.isEditing {
                Button {
                    self.isEditing = false
                    self.text = ""
                    
                    let action = #selector(UIResponder.resignFirstResponder)
                    UIApplication.shared.sendAction(action, to: nil, from: nil, for: nil)
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
