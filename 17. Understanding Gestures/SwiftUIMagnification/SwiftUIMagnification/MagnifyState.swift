//
//  MagnifyState.swift
//  SwiftUIMagnification
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

enum MagnifyState {
    case inactive, magnifying(scale: CGFloat)
        
    var scale: CGFloat {
        switch self {
        case .inactive:
            return 1.0
        case .magnifying(let scale):
            return scale
        }
    }
    /*
    var isPressing: Bool {
        switch self {
        case .pressing:
            return true
        case .inactive, .magnifying:
            return false
        }
    }
     */
}
