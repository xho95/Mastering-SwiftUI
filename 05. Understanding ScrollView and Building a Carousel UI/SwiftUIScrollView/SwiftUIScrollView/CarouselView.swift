//
//  CarouselView.swift
//  SwiftUIScrollView
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct CarouselView: View {
    func refineDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(refineDate())".uppercased())
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Your Reading")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                }
                .padding([.top, .horizontal])

                HStack {
                    Group {
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                    }
                    .frame(width: 300)
                }

            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
