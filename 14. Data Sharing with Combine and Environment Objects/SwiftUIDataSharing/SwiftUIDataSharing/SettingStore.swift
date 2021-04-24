//
//  SettingStore.swift
//  SwiftUIDataSharing
//
//  Created by Kim, Min Ho on 2021/04/24.
//

import Foundation

enum DisplayOrderType: Int, CaseIterable {      // CaseIterable for .allCases
    case alphabetical = 0
    case favoriteFirst = 1
    case checkInFirst = 2
    
    init(type: Int) {
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .favoriteFirst
        case 2:
            self = .checkInFirst
        default:
            self = .alphabetical
        }
    }
    
    var text: String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .favoriteFirst:
            return "Show Favorite First"
        case .checkInFirst:
            return "Show Check-in First"
        }
    }
}
