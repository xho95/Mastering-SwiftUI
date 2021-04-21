//
//  ContentView.swift
//  Representable
//
//  Created by Kim, Min Ho on 2021/04/21.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(url: "https://www.apple.com")
            .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        
        webView.load(URLRequest(url: URL(string: url)!))
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
}
