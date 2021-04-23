//
//  ContentView.swift
//  FancyButtonWithAnimation
//
//  Created by Kim, Min Ho on 2021/04/23.
//

import SwiftUI

struct FancyButton: View {
    @State private var state: ButtonState = .origin
    
    private var text: String {
        switch state {
        case .origin:
            return "Submit"
        case .processing:
            return "Processing"
        case .complete:
            return "Done"
        }
    }

    var body: some View {
        Button {
            withAnimation(Animation.easeInOut(duration: 0.1)) {
                switch state {
                case .origin:
                    startProcessing()
                case .processing:
                    break
                case .complete:
                    state = .origin
                }
            }
        } label: {
            HStack {
                if state == .processing {
                    CircularIndicator()
                        .frame(width: 25, height: 25)
                }
                Text(text)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .padding(.vertical)
            }
            .foregroundColor(.white)
            .frame(width: state == .origin ? 200 : 250)
            .background(state == .complete ? Color.red : .green)
            .cornerRadius(40)
        }
    }
    
    private func startProcessing() {
        state = .processing
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            state = .complete
        }
    }
    
    enum ButtonState {
        case origin, processing, complete
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FancyButton()
    }
}
