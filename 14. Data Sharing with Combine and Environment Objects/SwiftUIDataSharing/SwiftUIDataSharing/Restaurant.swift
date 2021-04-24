//
//  Restaurant.swift
//  SwiftUIDataSharing
//
//  Created by Kim, Min Ho on 2021/04/24.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var phone: String
    var image: String
    var priceLevel: Int
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}
