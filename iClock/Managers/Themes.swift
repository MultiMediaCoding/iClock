import SwiftUI

let clockThemes = [
    ClockTheme(name: "Simpel", view: AnyView(SimpleClockView(fontWeight: .light))),
    
    ClockTheme(name: "Fettgedruckte Schrift", view: AnyView(SimpleClockView(fontWeight: .bold))),
    
    ClockTheme(name: "Flipper", view: AnyView(ClassicThemeView())),
    
    ClockTheme(name: "Boxen", view: AnyView(BoxesClockView()))
]
