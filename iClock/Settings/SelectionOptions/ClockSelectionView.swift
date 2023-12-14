//
//  ClockSelectionView.swift
//  iClock
//
//  Created by Fabian Poreda on 28.10.22.
//

import SwiftUI

struct ClockSelectionView: View {
    
    @EnvironmentObject var themes: ThemeManager
    @EnvironmentObject var timeManager: TimeManager
    
    @State var selectedClockThemeName = "Simpel Light"
    
    var body: some View {
        
        var themeNames: [String] { clockThemes.compactMap({$0.name}) }
        
        ImageListView(selectedImageName: $selectedClockThemeName, imageNames: themeNames)
            .onChange(of: selectedClockThemeName, perform: { themeName in
                setNewClockTheme(themeName: selectedClockThemeName)
            })
            .onAppear(perform: {
                selectedClockThemeName = themes.currentClockTheme.name
            })
    }
    func setNewClockTheme(themeName: String) {
        
        if let theme = clockThemes.first(where: {$0.name == themeName}) {
            withAnimation(.easeInOut) {
                themes.currentClockTheme = theme
            }
        }
        
    }
}

struct ClockThemeItem: View {
    
    let image: Image
    
    var body: some View {
        
        image
            .resizable()
            .clipped()
            .frame(width: 180, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
    }
}
