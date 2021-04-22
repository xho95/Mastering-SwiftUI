//
//  ShapeProtocol.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct ShapeProtocol: View {
    var body: some View {
        /*
        Path() { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
            path.addLine(to: CGPoint(x: 200, y: 40))
            path.addLine(to: CGPoint(x: 0, y: 40))
            path.closeSubpath()
        }
        .fill(Color.green)
         */
        
        Path() { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: 200, y: 0), control: CGPoint(x: 100, y: -20))
            path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
        }
        .fill(Color.green)
    }
}

struct ShapeProtocol_Previews: PreviewProvider {
    static var previews: some View {
        ShapeProtocol()
    }
}
