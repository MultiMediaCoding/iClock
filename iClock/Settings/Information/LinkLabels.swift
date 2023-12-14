//
//  File.swift
//  
//
//  Created by Hans Poreda on 14.12.23.
//

import Foundation

struct LinkLabel {
    let title: String
    let systemName: String
    let url: String
}

let sourceCodeLinks: [LinkLabel] = [
    LinkLabel(title: "iClock", systemName: "clock", url: "https://github.com/MultiMediaCoding/iClock"),
    LinkLabel(title: "Flipper Uhr", systemName: "rectangle.ratio.3.to.4", url: "https://github.com/elpassion/FlipClock-SwiftUI")
]

let imageLinks: [LinkLabel] = [
    LinkLabel(title: "Mi.Picturs", systemName: "camera", url: "https://mipicturs.com")
]
