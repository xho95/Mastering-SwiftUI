//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Kim, Min Ho on 2021/04/22.
//

import SwiftUI

struct LabelButtonView: View {
    var body: some View {
        VStack {
            /*
            Button {
                print("Hello World tapped!")
            } label: {
                Text("Hello, world!")
                    .font(.title)
                    .padding()                  // The order of Modifiers is important
                    .background(Color.purple)
                    .foregroundColor(.white)
            }

            Button {
                print("Bordered World tapped!")
            } label: {
                Text("Bordered, world!")
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .border(Color.purple, width: 5)
            }

            Button {
                print("Double Bordered tapped!")
            } label: {
                Text("Double Bordered, world!")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .padding(10)
                    //.background(Color.white)
                    .border(Color.purple, width: 5)
            }

            Button {
                print("Hello World tapped!")
            } label: {
                Text("Hello, world!")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
            }

            Button {
                print("Hello World tapped!")
            } label: {
                Text("Hello, world!")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(40)           // the radius is the maximum possible value under the 40. (== 35)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)      // the radius is the maximum possible value
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
             */

            Button {
                print("Delete buton tapped!")
            } label: {
                Label(
                    title: {
                        Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    },
                    icon: {
                        Image(systemName: "trash")
                            .font(.title)
                    }
                )
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LabelButtonView()
    }
}
