//
//  ContentView.swift
//  SwiftUIAppStore
//
//  Created by Simon Ng on 10/9/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showContents: [Bool] = Array(repeating: false, count: sampleArticles.count)
    
    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                VStack(spacing: 40) {
                    TopBar()
                        .padding(.horizontal, 20)
                        .opacity(contentMode == .content ? 0 : 1)
                    
                    ForEach(sampleArticles.indices, id: \.self) { index in
                        GeometryReader { inner in
                            ArticleCardView(category: sampleArticles[index].category,
                                            headline: sampleArticles[index].headline,
                                            subHeadline: sampleArticles[index].subHeadline,
                                            image: sampleArticles[index].image,
                                            content: sampleArticles[index].content,
                                            isShowContent: $showContents[index])
                                .offset(y: showContents[index] ? -inner.frame(in: .global).minY : 0)
                                .padding(.horizontal, showContents[index] ? 0 : 20)
                                .opacity(
                                    contentMode == .list || (contentMode == .content && showContents[index]) ? 1 : 0
                                )
                                .onTapGesture {
                                    showContents[index] = true
                                }
                        }
                        .frame(height: showContents[index] ?
                                fullView.size.height + fullView.safeAreaInsets.top + fullView.safeAreaInsets.bottom :
                                min(sampleArticles[index].image.size.height / 3, 500))
                        .animation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.1))
                    }
                }
                .frame(width: fullView.size.width)
            }
        }
    }
    
    enum ContentMode {
        case list
        case content
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
