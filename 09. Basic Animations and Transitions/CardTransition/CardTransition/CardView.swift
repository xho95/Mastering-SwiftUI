//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack(alignment: .leading) {
                Text(category)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(heading)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                
                Text("Written by \(author)".uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack {
                    ForEach(0...4, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.vertical)

                Text("This is something to explain this card. However, I don't know exactly what is is, because there is no sentence in the book at all. So you may think it is just something to describe the title. ")
                    .lineLimit(10)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Kim, Min Ho")
    }
}
