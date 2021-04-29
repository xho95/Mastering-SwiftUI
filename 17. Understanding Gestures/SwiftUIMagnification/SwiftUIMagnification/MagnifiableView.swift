//
//  MagnifiableView.swift
//  SwiftUIMagnification
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

struct MagnifiableView<Content>: View where Content: View {
    @GestureState private var magnifyingState = MagnifyState.inactive
    @State private var magnification: CGFloat = 1.0
    
    var content: () -> Content
    
    var body: some View {
        content()
            //.opacity(magnifyingState.isPressing ? 0.5 : 1.0)
            .scaleEffect(magnification * magnifyingState.scale)
            .animation(.easeInOut)
            .gesture(
                MagnificationGesture(minimumScaleDelta: 0.1)
                    .updating($magnifyingState) { value, state, translation in
                        state = .magnifying(scale: value)
                    }
                    .onEnded { value in
                        self.magnification *= value
                    }
            )
    }
}

struct MagnifiableView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifiableView() {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
        }
    }
}
