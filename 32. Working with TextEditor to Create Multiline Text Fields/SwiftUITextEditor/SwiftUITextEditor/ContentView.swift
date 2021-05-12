//
//  ContentView.swift
//  SwiftUITextEditor
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var wordCount = 0
    
    var body: some View {
        TextEditor(text: $inputText)
            .font(.title)
            .padding()
            .padding(.top, 20)
            .onChange(of: inputText) { value in
                let words = value.split { $0 == " " || $0.isNewline }
                wordCount = words.count
            }
        
        Text("\(wordCount) words")
            .font(.headline)
            .foregroundColor(.secondary)
            .padding(.trailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
