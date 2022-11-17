//
//  TopBar.swift
//  SwiftUIAppStore
//
//  Created by Kim, Min Ho on 2021/05/09.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            Avatar(image: "profile-me", width: 40, height: 40)
        }
    }
    
    private func getCurrentDate(with format: String = "EEEE d MMMM") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}

struct Avatar: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 1)
            )
    }
}
