//
//  ContentView.swift
//  SwiftUIPhoto
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @State private var gridLayout: [GridItem] = [GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(samplePhotos.indices) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding(.all, 10)
            }
            .navigationTitle("Coffe Feed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
