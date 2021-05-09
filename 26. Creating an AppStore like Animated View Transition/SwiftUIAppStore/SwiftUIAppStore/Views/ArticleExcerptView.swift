//
//  ArticleExcerptView.swift
//  SwiftUIAppStore
//
//  Created by Kim, Min Ho on 2021/05/09.
//

import SwiftUI

struct ArticleExcerptView: View {
    let category: String
    let headline: String
    let subHeadline: String

    @Binding var isShowContent: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text(category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            Text(headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            if !self.isShowContent {
                                Text(subHeadline)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                )
        }
        .foregroundColor(Color(UIColor.systemBackground))
    }
}

struct ArticleExcerptView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let sample0 = sampleArticles[0]

            ArticleExcerptView(category: sample0.category,
                               headline: sample0.headline,
                               subHeadline: sample0.subHeadline,
                               isShowContent: .constant(false))
                .previewLayout(.fixed(width: 380, height: 500))
            ArticleExcerptView(category: sample0.category,
                               headline: sample0.headline,
                               subHeadline: sample0.subHeadline,
                               isShowContent: .constant(true))
                .previewLayout(.fixed(width: 380, height: 500))
        }
    }
}
