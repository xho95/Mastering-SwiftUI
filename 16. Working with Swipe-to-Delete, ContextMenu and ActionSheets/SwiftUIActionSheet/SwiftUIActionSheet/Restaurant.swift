//
//  Restaurant.swift
//  SwiftUIActionSheet
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
