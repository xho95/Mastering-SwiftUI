//
//  TaskProgress.swift
//  SwiftUIProgressRing
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import SwiftUI

struct TaskProgress: View {
    // Temporary
    struct Task {
        var name = ""
        var progress = 0.0
    }
    
    @Binding var task: Task
    
    var sliderColor: Color = .lightOrange
    
    private var progressText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: task.progress)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(task.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(progressText)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(Color.primary.opacity(0.8))
            }
            
                HStack {
                    Text("0%")
                        .font(.system(.subheadline, design: .rounded))
                    Slider(value: $task.progress, in: 0...1, step: 0.05)
                        .accentColor(sliderColor)
                    Text("100%")
                        .font(.system(.subheadline, design: .rounded))
                }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .padding(.horizontal)
    }
}

struct TaskProgress_Previews: PreviewProvider {
    static var previews: some View {
        TaskProgress(task: .constant(TaskProgress.Task()))
    }
}
