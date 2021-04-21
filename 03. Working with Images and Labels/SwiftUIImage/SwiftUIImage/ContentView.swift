//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        Image(systemName: "cloud.heavyrain")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
         */
        
        /*
        Image("paris")
            .resizable()
                //.edgesIgnoringSafeArea(.all)
                //.scaledToFit()                // == .aspectRatio(contentMode: .fit)
                //.scaledToFill()               // == .aspectRatio(contentMode: .fill)
            .aspectRatio(contentMode: .fill)
            .frame(width: 300)
                //.clipped()
            .clipShape(Circle())
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .opacity(0.5)
            )
        */
        
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                Text("If you are lucky enough to have lived in Paris as a young man, then whereever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .padding(),
                alignment: .top
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
