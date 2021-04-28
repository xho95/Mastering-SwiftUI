//
//  DragState.swift
//  SwiftUIGesture
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

enum DragState {
    case inactive, pressing, dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing:
            return true
        case .inactive, .dragging:
            return false
        }
    }
}
