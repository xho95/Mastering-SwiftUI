//
//  CircularIndicator.swift
//  SwiftUIRotation
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct CircularIndicator: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
            }
        }
    }
}

struct CircularIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircularIndicator()
    }
}
