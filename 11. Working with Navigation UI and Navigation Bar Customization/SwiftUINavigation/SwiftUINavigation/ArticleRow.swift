//
//  ArticleRow.swift
//  SwiftUINavigation
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
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 0)
            
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 0)
            
            HStack(spacing: 3) {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            
            Text(article.excerpt)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
struct ArticleRow_Previews: PreviewProvider {
    static var article = Article(title: "Test title",
                                 author: "Test Author",
                                 rating: 4,
                                 excerpt: "Test excerpt",
                                 image: "vision-framework",
                                 content: "Test content, blar blar blar.")

    static var previews: some View {
        ArticleRow(article: article)
    }
}
