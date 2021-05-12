//
//  MultiGridView.swift
//  SwiftUIPhoto
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct MultiGridView: View {
    @State private var gridLayout = [GridItem()]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring())
            }
            .navigationTitle("Coffe Feed")
        }
    }
}

struct MultiGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGridView()
    }
}
