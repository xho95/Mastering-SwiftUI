//
//  Article.swift
//  SwiftUIAppStore
//
//  Created by Simon Ng on 10/9/2020.
//

import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var category: String
    var headline: String
    var subHeadline: String
    var content: String
    var image: UIImage
}

#if DEBUG
var sampleArticles = [
    Article(
        category: "App of the Day",
        headline: "Adobe Premiere Rush CC is built to share",
        subHeadline: "Step up your video skills with these tips",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "egg")!
    ),
    Article(
        category: "SwiftUI Framework",
        headline: "Building a SwiftUI Search Bar",
        subHeadline: "Learn how to integrate UIKit with SwiftUI using UIViewRepresentable and build a search bar",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "mac-1")!
    ),
    Article(
        category: "Swift Language",
        headline: "A Beginner's Guide to Access Levels",
        subHeadline: "Today we we are going to talk about a topic that usually everybody knows something more or less, but it’s important for new developers in Swift to really understand",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "ipad-1")!
    ),
    Article(
        category: "Music Kit",
        headline: "Introduction to MusicKit: Building a Music Player in SwiftUI",
        subHeadline: "In this tutorial series, we’ll be building a very simple music player that searches using the Apple Music API for a song.",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "mac-4")!
    ),
    Article(
        category: "Swift Language",
        headline: "Understanding Higher Order Functions in Swift",
        subHeadline: "From the practical point of view in real world programming, higher order functions consist all together of a great tool that we can only have benefits from",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "iphone-2")!
    ),
    Article(
        category: "macOS Development",
        headline: "Implementing Drag And Drop Operations Using NSPasteboard",
        subHeadline: "One of the most common operations macOS users perform and they are quite familiar with is drag and drop.",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "mac-3")!
    ),
    Article(
        category: "Swift Playgrounds",
        headline: "Learn SwiftUI Using Swift Playgrounds for iPad",
        subHeadline: "I only have an iPad. Can I use it to develop iOS apps?",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "mac-2")!
    ),
    Article(
        category: "macOS Development",
        headline: "Creating Status Bar Apps on macOS",
        subHeadline: "We are just about to learn how to create status bar apps, or in other words, apps that live on the macOS top bar right next to the clock and other system",
        content: "I enjoy so much working with the SwiftUI framework. Like most new frameworks, however, one drawback is that it doesn’t come with all UI controls which are available in UIKit. For example, you can’t find a SwiftUI counterpart of text view. Thankfully, Apple provided a protocol called UIViewRepresentable that allows you easily wrap a UIView and make it available to your SwiftUI project.\n\nIn this article, we will show you how to create a text view by wrapping the UITextView class from UIKit using UIViewRepresentable.\n\nTo use a UIKit view in SwiftUI, you can wrap the view with the UIViewRepresentable protocol. Basically, you just need to create a struct in SwiftUI that adopts the protocol to create and manage a UIView object. Here is the skeleton of the custom wrapper for a UIKit view.",
        image: UIImage(named: "mac-5")!
    )
]
#endif

