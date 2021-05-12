//
//  ProgressTextModifier.swift
//  SwiftUIProgressRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ProgressTextModifier: AnimatableModifier {
    var progress: Double = 0.0
    var textColor: Color = .primary
    
    private var progressText: String {
        let formatter = NumberFormatter()

        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: progress)) ?? ""
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text(progressText)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .animation(nil)
            )
    }
}

extension View {
    func progressText(progress: Double, textColor: Color = Color.primary) -> some View {
        self.modifier(ProgressTextModifier(progress: progress, textColor: textColor))
    }
}
