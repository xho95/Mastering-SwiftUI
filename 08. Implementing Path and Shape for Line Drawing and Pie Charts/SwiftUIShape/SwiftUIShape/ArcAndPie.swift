//
//  ArcAndPie.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct ArcAndPie: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: center)
                path.addArc(center: center, radius: 150, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 190), clockwise: true)
            }
            .fill(Color(.systemYellow))

            Path() { path in
                path.move(to: center)
                path.addArc(center: center, radius: 150, startAngle: Angle(degrees: 190), endAngle: Angle(degrees: 110), clockwise: true)
            }
            .fill(Color(.systemTeal))

            Path() { path in
                path.move(to: center)
                path.addArc(center: center, radius: 150, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 90), clockwise: true)
            }
            .fill(Color(.systemBlue))

            Path() { path in
                path.move(to: center)
                path.addArc(center: center, radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 360), clockwise: true)
            }
            .fill(Color(.systemPurple))
            .offset(x: 20, y: 20)

            Path() { path in
                path.move(to: center)
                path.addArc(center: center, radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 360), clockwise: true)
                path.closeSubpath()
            }
            .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 10)
            .offset(x: 20, y: 20)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 80, y: -100)
            )
        }
    }
    
    private var center = CGPoint(x: 187, y: 187)
}

struct ArcAndPie_Previews: PreviewProvider {
    static var previews: some View {
        ArcAndPie()
    }
}
