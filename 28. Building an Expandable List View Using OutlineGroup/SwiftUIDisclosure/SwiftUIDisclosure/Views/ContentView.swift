//
//  ContentView.swift
//  SwiftUIDisclosure
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @State var showContent = Array(repeating: false, count: sampleFAQs.count)

    var body: some View {
        NavigationView {
            List {
                ForEach(sampleFAQs.indices) { index in
                    FAQView(showContent: $showContent[index],
                            label: sampleFAQs[index].label,
                            content: sampleFAQs[index].content)
                }
            }
            .navigationTitle("FAQ")
            .navigationBarItems(
                trailing: Button {
                    self.showContent = self.showContent.map { _ in true }
                } label: {
                    Text("Show all")
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
