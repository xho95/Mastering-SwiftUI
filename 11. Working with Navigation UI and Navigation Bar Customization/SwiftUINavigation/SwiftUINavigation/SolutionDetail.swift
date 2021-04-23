//
//  SolutionDetail.swift
//  SwiftUINavigation
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct SolutionDetail: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)

                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)

                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(100)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

struct SolutionDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SolutionDetail(article: articles[0])
        }
    }
}
