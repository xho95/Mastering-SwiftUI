//
//  GradientButtonView.swift
//  SwiftUIButton
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct GradientButtonView: View {
    var body: some View {
        Button {
            print("Share tapped!")
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .font(.title)
                Text("Share")
                    .fontWeight(.semibold)
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
        
        Button {
            print("Edit tapped!")
        } label: {
            HStack {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                Text("Edit")
                    .fontWeight(.semibold)
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
        
        Button {
            print("Delete tapped!")
        } label: {
            HStack {
                Image(systemName: "trash")
                    .font(.title)
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]),
                               startPoint: .leading,
                               endPoint: .trailing)
            )
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonView()
    }
}
