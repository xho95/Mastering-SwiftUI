//
//  IndividualCounterButton.swift
//  SwiftUIState
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct IndividualCounterButton: View {
    @State private var counter = 0
    @Binding var totalCounter: Int
    
    var color: Color
    
    var body: some View {
        Button {
            self.counter += 1
            self.totalCounter += 1
        } label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(
                    Text("\(counter)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}

struct IndividualCounterButton_Previews: PreviewProvider {
    static var previews: some View {
        IndividualCounterButton(totalCounter: .constant(0), color: .red)
    }
}
