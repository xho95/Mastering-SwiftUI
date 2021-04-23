//
//  Article.swift
//  SwiftUIArticle
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import Foundation

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var rating: Int
    var excerpt: String
    var image: String
}
