//
//  ArticleRow.swift
//  SwiftUIArticle
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)

            Text(article.title)
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.primary)
                .padding(.bottom, 5)

            Text("by \(article.author)".uppercased())
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 5)

            HStack {
                ForEach(1...article.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding(.bottom, 5)
            
            Text(article.excerpt)
                .foregroundColor(.secondary)

        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var article = Article(title: "The Comprehensive Guide to the State Management in iOS", author: "Alexey Naumov", rating: 4, excerpt: "There are many challenges in the software development, but there is one beast that tends to screw things up much more often than the others: the problem of app’s state management and data propagation.", image: "state-management")
    
    static var previews: some View {
        ArticleRow(article: article)
    }
}
