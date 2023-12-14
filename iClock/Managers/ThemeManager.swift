//
//  File.swift
//  
//
//  Created by Fabian Poreda on 26.10.22.
//

import SwiftUI

class ThemeManager: ObservableObject {
    
    @Published var currentBackground: Background = Background(imageName: "Normal", primary: .white, secondary: .black, singleColor: .white)
    
    @Published var currentClockTheme = ClockTheme(name: "Flipper", view: AnyView(AllFlipsView()))
    
}
