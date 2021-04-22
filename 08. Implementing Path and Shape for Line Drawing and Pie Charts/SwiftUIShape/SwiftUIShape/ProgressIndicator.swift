//
//  ProgressIndicator.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct ProgressIndicator: View {
    private var purpleGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255),
                                    Color(red: 107/255, green: 116/255, blue: 179/255)]),
        startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 250, height: 250)
            
            Circle()
                .trim(from: 0, to: 0.85)                    // trim between 0 and 1
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 250, height: 250)
                .overlay(
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemGray))
                    }
                )
        }
    }
}

struct ProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicator()
    }
}
