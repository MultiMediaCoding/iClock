//
//  SwiftUIView.swift
//  
//
//  Created by Hans Poreda on 14.12.23.
//

import SwiftUI

struct LinksView: View {
    let category: String
    let linkLabels: [LinkLabel]
    var body: some View {
        NavigationStack {
            List(linkLabels, id: \.title) { label in
                NavigationLink {
                    if let url = URL(string: label.url) {
                        WebView(url: url)
                            .ignoresSafeArea()
                    }
                } label: {
                    Label(label.title, systemImage: label.systemName)
                }

            }
            .navigationTitle(category)
        }
    }
}


