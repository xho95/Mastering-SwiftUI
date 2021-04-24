//
//  ContentView.swift
//  SwiftUIModal
//
//  Created by Simon Ng on 19/8/2020.
//

// According to the [SwiftUI: Sheet cannot show correct values in first time](https://stackoverflow.com/questions/64798211/swiftui-sheet-cannot-show-correct-values-in-first-time), `.sheet(item:)` is better than `.sheet(isPresented:content:)`.

import SwiftUI

struct ContentView: View {
    //@State private var showDetailView = false
    //@State private var selectedArticle: Article?
    @State private var selected: Article?

    var body: some View {
        NavigationView {
            List(articles) { article in
                ArticleRow(article: article)
                    .onTapGesture {
                        selected = article
                        //showDetailView = true
                    }
            }
            .sheet(item: $selected) { item in                   // better one
                ArticleDetailView(article: item)
            }
            /*
            .sheet(isPresented: $showDetailView) {              // old sheet style
                //print("\(selectedArticle.title)")
                if let selectedArticle = selectedArticle {
                    ArticleDetailView(article: selectedArticle)
                }
            }*/
            .navigationBarTitle("Your Reading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
