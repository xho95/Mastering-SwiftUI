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
            Text("\(count)")
                .font(.system(size: 100, design: .rounded))
        }
        .buttonStyle(CounterButtonStyle())
    }
}

struct CounterButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct CounterButton_Previews: PreviewProvider {
    static var previews: some View {
        CounterButton()
    }
}
