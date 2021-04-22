//
//  SwiftUIAnimationApp.swift
//  SwiftUIAnimation
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

@main
struct SwiftUIAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ImplicitAnimation()
                ExplicitAnimation()
            }
        }
    }
}
