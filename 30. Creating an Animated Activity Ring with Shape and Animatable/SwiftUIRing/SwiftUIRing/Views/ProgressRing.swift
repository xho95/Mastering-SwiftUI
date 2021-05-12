//
//  ProgressRing.swift
//  SwiftUIRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ProgressRing: View {
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var gradient = Gradient(colors: [.dardPurple, .lightYellow])
    var startAngle = -90.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)
            
            RingShape(progress: 0.5, thickness: thickness)
                .fill(AngularGradient(gradient: gradient, center: .center,
                                      startAngle: .degrees(startAngle),
                                      endAngle: .degrees(startAngle + 360 * 0.5)))
        }
        .frame(width: width, height: width, alignment: .center)
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
