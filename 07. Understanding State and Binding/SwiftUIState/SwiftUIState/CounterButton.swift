//
//  CounterButton.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct CounterButton: View {
    @State private var count = 0
    
    var body: some View {
        Button {
            self.count += 1
        } label: {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .overlay(
                    Text("\(count)")
                        .font(.system(size: 100, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct CounterButton_Previews: PreviewProvider {
    static var previews: some View {
        CounterButton()
    }
}
