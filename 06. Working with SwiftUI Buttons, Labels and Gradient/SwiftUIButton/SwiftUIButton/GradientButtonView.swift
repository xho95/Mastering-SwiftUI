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
            print("Delete buton tapped!")
        } label: {
            Label(
                title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(.title)
                }
            )
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
        }
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonView()
    }
}
