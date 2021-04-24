//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Kim, Min Ho on 2021/04/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedOrder = DisplayOrderType.alphabetical
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    
    var settingStore: SettingStore

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { orderType in
                            Text(orderType.text)
                        }
                    }
                }
                
                Section(header: Text("FILTER PREFERENCE")) {
                    Toggle(isOn: $showCheckInOnly) {
                        Text("Show Check-in Only")
                    }
                    
                    Stepper {
                        maxPriceLevel += 1
                        
                        if maxPriceLevel > 5 {
                            maxPriceLevel = 5
                        }
                    } onDecrement: {
                        maxPriceLevel -= 1
                        
                        if maxPriceLevel < 1 {
                            maxPriceLevel = 1
                        }
                    } label: {
                        Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(
                leading: Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                },
                trailing: Button {
                    self.settingStore.showCheckInOnly = self.showCheckInOnly
                    self.settingStore.displayOrder = self.selectedOrder
                    self.settingStore.maxPriceLevel = self.maxPriceLevel

                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            )
        }
        .onAppear() {
            self.selectedOrder = self.settingStore.displayOrder
            self.showCheckInOnly = self.settingStore.showCheckInOnly
            self.maxPriceLevel = self.settingStore.maxPriceLevel
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingStore: SettingStore())
    }
}
