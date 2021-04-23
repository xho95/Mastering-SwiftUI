//
//  SolutionDetail.swift
//  SwiftUINavigation
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct SolutionDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
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
        .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        )
        //.navigationBarHidden(true)
    }
}

struct SolutionDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SolutionDetail(article: articles[0])
        }
    }
}
