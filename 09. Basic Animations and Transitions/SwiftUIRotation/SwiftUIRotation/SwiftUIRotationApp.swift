//
//  SwiftUIRotationApp.swift
//  SwiftUIRotation
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

@main
struct SwiftUIRotationApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                CircularIndicator()
                    .padding(.vertical, 25)
                LinearIndicator()
                    .padding(.vertical, 25)
                ProgressIndicator()
                    .padding(.vertical, 25)
                DotIndicator()
                    .padding(.vertical, 25)
            }
        }
    }
}
