//
//  MultiRing.swift
//  SwiftUIRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct MultiRing: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                ProgressRing(progress: $progress, width: 300, thickness: 30,
                             gradient: Gradient(colors: [.darkPurple, .lightPurple]))
                ProgressRing(progress: $progress, width: 236, thickness: 30,
                             gradient: Gradient(colors: [.darkYellow, .lightYellow]))
                ProgressRing(progress: $progress, width: 172, thickness: 30,
                             gradient: Gradient(colors: [.darkGreen, .lightGreen]))
            }
            
            HStack {
                Group {
                    Text("25%")
                        .font(.system(size: 15, design: .rounded))
                        .onTapGesture {
                            progress = 0.25
                        }
                    
                    Text("50%")
                        .font(.system(size: 15, design: .rounded))
                        .onTapGesture {
                            progress = 0.5
                        }
                                        
                    Text("75%")
                        .font(.system(size: 15, design: .rounded))
                        .onTapGesture {
                            progress = 0.75
                        }
                    
                    Text("100%")
                        .font(.system(size: 15, design: .rounded))
                        .onTapGesture {
                            progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
            }
            .padding()
        }
    }
}

struct MultiRing_Previews: PreviewProvider {
    static var previews: some View {
        MultiRing()
    }
}
