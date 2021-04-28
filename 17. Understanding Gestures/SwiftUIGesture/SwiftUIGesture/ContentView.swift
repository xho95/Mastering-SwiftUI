//
//  ContentView.swift
//  SwiftUIGesture
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

struct ContentView: View {
    //@State private var isPressed = false
    @State private var position = CGSize.zero
    
    @GestureState private var isPressed = false
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(isPressed ? 0.5 : 1.0)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            //.scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .updating($isPressed) { currentState, state, transaction in  // value, state, transaction
                        state = currentState
                    }
                    .sequenced(before: DragGesture())
                    .updating($dragOffset) { value, state, transaction in
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    }
                    .onEnded { value in
                        guard case .second(true, let drag?) = value else { return }
                        
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
