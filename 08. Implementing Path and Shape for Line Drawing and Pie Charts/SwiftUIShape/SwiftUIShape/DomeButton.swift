//
//  DomeButton.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct DomeButton: View {
    var body: some View {
        VStack {
            Button {
                //
            } label: {
                Text("Test")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Dome().fill(Color.red))
            }
            
            Circle()
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                )
        }
    }
}

struct DomeButton_Previews: PreviewProvider {
    static var previews: some View {
        DomeButton()
    }
}
