//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(articles) { article in
                NavigationLink(destination: ArticleDetail(article: article)) {
                    ArticleRow(article: article)
                }
            }
            .navigationTitle("Your Reading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



