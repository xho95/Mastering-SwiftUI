//
//  AnimatingPlusButton.swift
//  SwiftUIButton
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct AnimatingPlusButton: View {
    var body: some View {
        Button {
            print("Animating Plus is tapped!")
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(RotateButtonStyle())
    }
}

struct RotateButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .clipShape(Circle())
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}

struct AnimatingPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingPlusButton()
    }
}
