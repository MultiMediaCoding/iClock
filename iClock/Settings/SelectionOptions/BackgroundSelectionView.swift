//
//  Back.swift
//  iClock
//
//  Created by Fabian Poreda on 28.10.22.
//

import SwiftUI

struct BackgroundSelectionView: View {
    
    @EnvironmentObject var themes: ThemeManager
    @State var selectedBackgroundImageName = "Normal"
    
    var body: some View {
        
        var imageNames: [String] { backgrounds.compactMap({$0.imageName}) }

        ImageListView(selectedImageName: $selectedBackgroundImageName, imageNames: imageNames)
            .onChange(of: selectedBackgroundImageName, perform: { imageName in
                setNewBackground(imageName: imageName)
            })
            .onAppear(perform: {
            selectedBackgroundImageName = themes.currentBackground.imageName
        })
        
    }
    
    func setNewBackground(imageName: String) {
        for background in backgrounds {
            if background.imageName == imageName {
                withAnimation(.easeInOut) { 
                    themes.currentBackground = background
                }
            }
        }
    }
}


