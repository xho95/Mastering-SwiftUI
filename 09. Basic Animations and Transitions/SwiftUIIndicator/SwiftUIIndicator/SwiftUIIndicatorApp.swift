//
//  SwiftUIIndicatorApp.swift
//  SwiftUIIndicator
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

@main
struct SwiftUIIndicatorApp: App {
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
                MorphingButton()
                    .padding(.vertical, 25)
            }
        }
    }
}
