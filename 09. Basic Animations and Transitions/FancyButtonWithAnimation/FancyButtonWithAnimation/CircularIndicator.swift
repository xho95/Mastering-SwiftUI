//
//  CircularIndicator.swift
//  FancyButtonWithAnimation
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct CircularIndicator: View {
    @State private var rotating = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.75)
            .stroke(Color.white, lineWidth: 3)
            .rotationEffect(Angle(degrees: rotating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear() {
                self.rotating = true
            }
    }
}

struct CircularIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircularIndicator()
    }
}
