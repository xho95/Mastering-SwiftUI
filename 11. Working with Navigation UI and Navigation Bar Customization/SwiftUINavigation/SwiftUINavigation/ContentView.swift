//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(articles) { article in
            ArticleRow(article: article)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



