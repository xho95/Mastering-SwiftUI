//
//  ContentView.swift
//  SwiftUIMatchedGeometry
//
//  Created by Kim, Min Ho on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var shapeTransition
    
    @State private var expand = false
    
    var body: some View {
        if expand {         // final state
            Circle()
                .fill(Color.green)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 300, height: 300)
                .offset(y: -200)
                .animation(.default)
                .onTapGesture {
                    expand.toggle()
                }
        } else {            // initial state
            Circle()
                .fill(Color.green)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 150, height: 150)
                .offset(y: 0)
                .animation(.default)
                .onTapGesture {
                    expand.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
