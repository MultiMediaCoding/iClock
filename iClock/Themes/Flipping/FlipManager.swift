//
//  File.swift
//  
//
//  Created by Fabian Poreda on 21.10.22.
//

import SwiftUI

class FlipManager: ObservableObject {
    @Published var animateTop: Bool = false
    @Published var animateBottom: Bool = false
    
    func updateText() {
        withAnimation(Animation.easeIn(duration: 0.2)) { [weak self] in
            self?.animateTop = true
        }

        withAnimation(Animation.easeOut(duration: 0.2).delay(0.2)) { [weak self] in
            self?.animateBottom = true
        }
    }
}
