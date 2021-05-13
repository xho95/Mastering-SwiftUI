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
            Spacer()
            
            RoundedRectangle(cornerRadius: 50.0)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 300)
                .padding()
                .foregroundColor(Color(.systemGreen))
                .animation(.easeIn)
                .onTapGesture {
                    expand.toggle()
                }
        } else {            // initial state
            RoundedRectangle(cornerRadius: 50.0)
                .matchedGeometryEffect(id: "circle", in: shapeTransition)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(.systemOrange))
                .animation(.easeIn)
                .onTapGesture {
                    expand.toggle()
                }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
