//
//  ProgressRingLibrary.swift
//  SwiftUIProgressRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ProgressRingLibrary: LibraryContentProvider {
    @LibraryContentBuilder var views: [LibraryItem] {
        LibraryItem(ProgressRingView(progress: .constant(1.0),
                                     thickness: 12.0,
                                     width: 130.0,
                                     gradient: Gradient(colors: [.darkYellow, .lightYellow])),
                    title: "Progress Ring",
                    category: .control)
        
        LibraryItem(ProgressRingView(progress: .constant(1.0),
                                     thickness: 30.0,
                                     width: 250.0,
                                     gradient: Gradient(colors: [.darkPurple, .lightYellow])),
                    title: "Progress Ring - Bigger",
                    category: .control)
    }
    
    @LibraryContentBuilder
    func modifiers(base: Circle) -> [LibraryItem] {
        LibraryItem(base.progressText(progress: 1.0),
                    title: "Progress Indicator",
                    category: .control)
    }
}
