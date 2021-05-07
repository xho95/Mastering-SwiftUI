//
//  SearchBar.swift
//  ToDoSearch
//
//  Created by Kim, Min Ho on 2021/05/07.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search..."
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Hi!"))
    }
}
