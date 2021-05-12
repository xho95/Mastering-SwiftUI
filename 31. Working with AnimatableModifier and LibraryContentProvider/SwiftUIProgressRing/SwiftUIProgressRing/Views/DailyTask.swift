//
//  DailyTask.swift
//  SwiftUIProgressRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct DailyTask: View {
    var body: some View {
        VStack {
            Text("Daily Task")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            HStack {
                Text("Overall")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                
                ProgressRingView(progress: /*@START_MENU_TOKEN@*/.constant(1.0)/*@END_MENU_TOKEN@*/,
                                 thickness: /*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/,
                                 width: /*@START_MENU_TOKEN@*/130.0/*@END_MENU_TOKEN@*/,
                                 gradient: Gradient(colors: [.darkYellow, .lightYellow]))
            }
            .padding()
            .background(Color.darkBlue)
            .foregroundColor(.white)
        }
        .padding()
    }
}

struct DailyTask_Previews: PreviewProvider {
    static var previews: some View {
        DailyTask()
    }
}
