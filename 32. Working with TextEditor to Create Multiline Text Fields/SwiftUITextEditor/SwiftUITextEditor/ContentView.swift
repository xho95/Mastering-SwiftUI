//
//  ContentView.swift
//  SwiftUITextEditor
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    
    var body: some View {
        TextEditor(text: $inputText)
            .font(.title)
            .lineSpacing(20)
            .autocapitalization(.words)
            .disableAutocorrection(true)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
