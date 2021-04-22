//
//  DomeButton.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct DomeButton: View {
    var body: some View {
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
    }
}

struct DomeButton_Previews: PreviewProvider {
    static var previews: some View {
        DomeButton()
    }
}
