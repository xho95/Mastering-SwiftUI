//
//  Photo.swift
//  SwiftUIPhoto
//
//  Created by Kim, Min Ho on 2021/05/12.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}

let samplePhotos = (1...20).map { Photo(name: "coffee-\($0)") }
