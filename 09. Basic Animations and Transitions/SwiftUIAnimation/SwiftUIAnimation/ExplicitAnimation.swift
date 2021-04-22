//
//  ExplicitAnimation.swift
//  SwiftUIAnimation
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .pink)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .pink : .white)
                .font(.system(size: 100))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.heartColorChanged.toggle()
                self.heartSizeChanged.toggle()
            }

            self.circleColorChanged.toggle()
        }
    }
}

struct ExplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
