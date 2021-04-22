//
//  DotIndicator.swift
//  SwiftUIRotation
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct DotIndicator: View {
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(
                        Animation
                            .linear(duration: 0.6)
                            .repeatForever()
                            .delay(0.2 * Double(index))
                    )
            }
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}

struct DotIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DotIndicator()
    }
}
