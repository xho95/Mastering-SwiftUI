//
//  ProgressRing.swift
//  SwiftUIRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ProgressRing: View {
    @Binding var progress: Double
    
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var gradient = Gradient(colors: [.dardPurple, .lightYellow])
    var startAngle = -90.0
    
    private var radius: Double {
        Double(width / 2)
    }
    
    private var ringTipShadowOffset: CGPoint {
        let shadowPosition = ringTipPosition(progress: progress + 0.01)
        let circlePosition = ringTipPosition(progress: progress)
        
        return CGPoint(x: shadowPosition.x - circlePosition.x,
                       y: shadowPosition.y - circlePosition.y)
    }
    
    private func ringTipPosition(progress: Double) ->CGPoint {                  // duplicated code within RingTip?
        let angleInDegree = startAngle + 360 * progress
        let angle = angleInDegree * .pi / 180
        
        return CGPoint(x: radius * cos(angle), y: radius * sin(angle))
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)
            
            RingShape(progress: progress, thickness: thickness)
                .fill(AngularGradient(gradient: gradient, center: .center,
                                      startAngle: .degrees(startAngle),
                                      endAngle: .degrees(startAngle + 360 * progress)))
            
            RingTip(progress: progress, startAngle: startAngle, ringRadius: radius)
                .frame(width: thickness, height: thickness)
                .foregroundColor(progress > 0.96 ? gradient.stops[1].color : Color.clear)
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.15) : Color.clear,
                        radius: 2, x: ringTipShadowOffset.x, y: ringTipShadowOffset.y)
        }
        .frame(width: width, height: width, alignment: .center)
        .animation(Animation.easeInOut(duration: 1.0))
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressRing(progress: .constant(0.5))
                .previewLayout(.fixed(width: 300, height: 300))
            ProgressRing(progress: .constant(0.9))
                .previewLayout(.fixed(width: 300, height: 300))
        }
    }
}
