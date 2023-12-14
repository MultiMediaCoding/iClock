import SwiftUI

@main
struct iClockApp: App {
    
    @StateObject var screenSize = ScreenSize()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(screenSize)
        }
    }
}
