//
//  DragState.swift
//  SwiftUIBottomSheet
//
//  Created by Kim, Min Ho on 2021/04/29.
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
    
    var isDragging: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}
