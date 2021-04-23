//
//  ArticleDetail.swift
//  SwiftUINavigation
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct ArticleDetail: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .lineLimit(3)
                    .padding(.bottom, 5)

                Text("By \(article.author)".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)

                Text(article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ArticleDetail(article: articles[0])
        }
    }
}
