//
//  Themes.swift
//  iClock
//
//  Created by Fabian Poreda on 20.10.22.
//

import SwiftUI

struct ClassicThemeView: View {

    var body: some View {
        GeometryReader { geo in
            VStack {
                AllFlipsView()
            }
            .position(x: geo.size.width/2, y: geo.size.height/2)
        }
    }
}
