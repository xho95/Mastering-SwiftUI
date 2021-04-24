//
//  SwiftUIDataSharingApp.swift
//  SwiftUIForm
//
//  Created by Simon Ng on 19/8/2020.
//

import SwiftUI

@main
struct SwiftUIDataSharingApp: App {
    var settingStore = SettingStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingStore)
        }
    }
}
