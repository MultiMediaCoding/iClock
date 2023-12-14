//
//  SwiftUIView.swift
//  
//
//  Created by Hans Poreda on 14.12.23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        List(informationCategories, id: \.title) { category in
            NavigationLink {
                LinksView(category: category.title, linkLabels: category.linkLabels)
            } label: {
                Label(category.title, systemImage: category.systemName)
            }

        }
    }
}

#Preview {
    InformationView()
}
