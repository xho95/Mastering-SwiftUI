//
//  RingTip.swift
//  SwiftUIRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct RingTip: Shape {
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    private var position: CGPoint {
        let angleInDegree = startAngle + 360 * progress
        let angle = angleInDegree * .pi / 180
        
        return CGPoint(x: ringRadius * cos(angle), y: ringRadius * sin(angle))
    }
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard progress > 0.0 else { return path }
        
        let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)
        path.addRoundedRect(in: frame, cornerSize: frame.size)
        
        return path
    }
}
