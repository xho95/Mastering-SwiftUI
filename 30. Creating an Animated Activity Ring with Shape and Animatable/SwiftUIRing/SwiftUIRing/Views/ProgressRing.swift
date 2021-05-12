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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)
            
            RingShape(progress: progress, thickness: thickness)
                .fill(AngularGradient(gradient: gradient, center: .center,
                                      startAngle: .degrees(startAngle),
                                      endAngle: .degrees(startAngle + 360 * progress)))
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
