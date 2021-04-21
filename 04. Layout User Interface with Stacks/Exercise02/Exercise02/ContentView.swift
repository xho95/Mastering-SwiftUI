//
//  ContentView.swift
//  Exercise02
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PricingView: View {
    var icon: String?
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            /*
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            */
            icon.map {
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(icon == nil ? 40 : 20)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct LabelView: View {
    var label: String
    var yOffset: CGFloat
    
    var body: some View {
        Text(label)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: yOffset)
    }
}
