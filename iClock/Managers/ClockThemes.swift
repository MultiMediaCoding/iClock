import SwiftUI

let clockThemes = [
    ClockTheme(name: "Simpel Light", view: AnyView(SimpleClockView(fontWeight: .light))),
    
    ClockTheme(name: "Simpel Bold", view: AnyView(SimpleClockView(fontWeight: .bold))),
    
    ClockTheme(name: "Flipper", view: AnyView(ClassicThemeView())),
    
    ClockTheme(name: "Box", view: AnyView(BoxesClockView()))
]
