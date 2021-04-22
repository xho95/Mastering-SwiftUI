//
//  CounterButton.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct CounterButton: View {
    @Binding var counter: Int
    
    var color: Color = .gray
    
    var body: some View {
        Button {
            self.counter += 1
        } label: {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct CounterButton_Previews: PreviewProvider {
    static var previews: some View {
        CounterButton(counter: .constant(1), color: .red)
    }
}
