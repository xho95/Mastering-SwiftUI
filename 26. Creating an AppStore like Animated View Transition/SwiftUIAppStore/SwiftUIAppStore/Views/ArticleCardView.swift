//
//  ArticleCardView.swift
//  SwiftUIAppStore
//
//  Created by Kim, Min Ho on 2021/05/09.
//

import SwiftUI

struct ArticleCardView: View {
    let category: String
    let headline: String
    let subHeadline: String
    let image: UIImage
    
    var content: String = ""
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: isShowContent ?
                                    geometry.size.height * 0.7 : min(image.size.height / 3, 500))
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1),
                                    width: isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay(
                                ArticleExcerptView(category: category,
                                                   headline: headline,
                                                   subHeadline: subHeadline,
                                                   isShowContent: $isShowContent)
                                    .cornerRadius(isShowContent ? 0 : 15)
                            )
                        
                        if isShowContent {
                            Text(content)
                                .foregroundColor(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .top))
                                .animation(.linear)
                        }
                    }
                }
                .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3),
                    radius: isShowContent ? 0 : 15)
                
                if isShowContent {
                    HStack {
                        Spacer()
                        
                        Button {
                            self.isShowContent = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let sample0 = sampleArticles[0]
            let sample1 = sampleArticles[1]

            ArticleCardView(category: sample0.category, headline: sample0.headline,
                            subHeadline: sample0.subHeadline, image: sample0.image,
                            content: sample0.content, isShowContent: .constant(false))
            ArticleCardView(category: sample1.category, headline: sample1.headline,
                            subHeadline: sample1.subHeadline, image: sample1.image,
                            content: sample1.content, isShowContent: .constant(true))
            ArticleCardView(category: sample0.category, headline: sample0.headline,
                            subHeadline: sample0.subHeadline, image: sample0.image,
                            content: sample0.content, isShowContent: .constant(false))
                .previewLayout(.fixed(width: 380, height: 500))
            ArticleCardView(category: sample0.category, headline: sample0.headline,
                            subHeadline: sample0.subHeadline, image: sample0.image,
                            content: sample0.content, isShowContent: .constant(true))
                .previewLayout(.fixed(width: 380, height: 500))
        }
    }
}
