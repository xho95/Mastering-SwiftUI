//
//  ContentView.swift
//  SwiftUISwappingView
//
//  Created by Kim, Min Ho on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    @State private var swap = false
    
    @Namespace private var dotTransition
    
    var body: some View {
        if swap {       // after swap
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "greenCircle", in: dotTransition)
                
                Spacer()
                
                Circle()
                    .fill(Color.orange)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "orangeCircle", in: dotTransition)
            }
            .frame(width: 100)
            .animation(.linear)
            .onTapGesture {
                swap.toggle()
            }
        } else {       // before swap
            HStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "orangeCircle", in: dotTransition)
                
                Spacer()
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .matchedGeometryEffect(id: "greenCircle", in: dotTransition)
            }
            .frame(width: 100)
            .animation(.linear)
            .onTapGesture {
                swap.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
