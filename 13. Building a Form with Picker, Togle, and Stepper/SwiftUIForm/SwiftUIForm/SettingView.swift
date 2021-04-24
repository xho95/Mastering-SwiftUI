//
//  SettingView.swift
//  SwiftUIForm
//
//  Created by Kim, Min Ho on 2021/04/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SORT PREFERENCE")) {
                    Picker(selection: $selectedOrder, label: Text("Display Order")) {
                        ForEach(0..<displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
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
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            )
        }
    }
    
    private let displayOrders = [
        "Alphabetical", "Show Favorite First", "Show Check-in First"
    ]
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
