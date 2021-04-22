//
//  SwiftUIShapeApp.swift
//  SwiftUIShape
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

@main
struct SwiftUIShapeApp: App {
    var body: some Scene {
        WindowGroup {
            //GreenRectangle()
            //PurpleDome()
            //ArcAndPie()
            //ShapeProtocol()
            //DomeButton()
            VStack {
                ProgressIndicator()
                    .padding(.vertical, 50)
                DonutChart()
                    .padding(.vertical, 50)
            }
        }
    }
}
