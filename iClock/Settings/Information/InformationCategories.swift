//
//  File.swift
//  
//
//  Created by Hans Poreda on 14.12.23.
//

import SwiftUI

struct InformationLabel {
    let title: String
    let systemName: String
    let linkLabels: [LinkLabel]
}

let informationCategories: [InformationLabel] = [
    InformationLabel(title: "Quellcode", systemName: "swift", linkLabels: sourceCodeLinks),
    InformationLabel(title: "Bilder", systemName: "photo", linkLabels: imageLinks),
]
