//
//  DraggableView.swift
//  SwiftUIGesture
//
//  Created by Kim, Min Ho on 2021/04/28.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View {
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width,
                    y: position.height + dragState.translation.height)
            .animation(.easeInOut)
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .sequenced(before: DragGesture())
                    .updating($dragState) { value, state, translation in
                        switch value {
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                    }
                    .onEnded { value in
                        guard case .second(true, let drag?) = value else { return }
                        
                        self.position.width += drag.translation.width
                        self.position.height += drag.translation.height
                    }
            )
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView() {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
        }
    }
}
