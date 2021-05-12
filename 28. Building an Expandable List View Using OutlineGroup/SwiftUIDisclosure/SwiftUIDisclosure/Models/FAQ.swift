//
//  FAQ.swift
//  SwiftUIDisclosure
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import Foundation

struct FAQ: Identifiable {
    var id = UUID()
    var label: String
    var content: String
}

let sampleFAQs = [
    FAQ(label: "1. Can I reuse the source code?",
        content: "Absolutelty! You are allowed to reuse the source code in your own projects (personal/commercial). However, you're not allowed to distribute or sell the source code without prior authorization."),
    FAQ(label: "2. Will I get free update?",
        content: "Yes! The update applies to all packages. Once you purchase the book, you will get free updates for 1 year."),
    FAQ(label: "3. How can I get the book updates?",
        content: "Whenever we update the learning materials, we will send you an email notification with the download instructions."),
]
