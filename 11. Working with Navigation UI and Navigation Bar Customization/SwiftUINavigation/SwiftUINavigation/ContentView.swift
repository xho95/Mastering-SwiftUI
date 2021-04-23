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
                ZStack {
                    ArticleRow(article: article)
                    
                    NavigationLink(destination: SolutionDetail(article: article)) {
                        EmptyView()     // It is not perfect by itself!
                    }
                    .opacity(0)         // Important!!
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



