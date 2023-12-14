import SwiftUI

struct ContentView: View {
    
    @StateObject var themes = ThemeManager()
    @StateObject var timeManager = TimeManager()
    @EnvironmentObject var screenSize: ScreenSize
    
    @State private var themeSelectionSheetIsPresented = false
    @State private var settingsDetent = PresentationDetent.medium
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                NavigationView {
                    
                    ZStack {
                        
                        Image(themes.currentBackground.imageName)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        
                        themes.currentClockTheme.view
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    }
                    
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .sheet(isPresented: $themeSelectionSheetIsPresented, content: {
                        SettingsView(showSheet: $themeSelectionSheetIsPresented)
                    })
                    .toolbar {
                        
                        // Button to open the options sheet
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation(.spring()) {
                                    themeSelectionSheetIsPresented.toggle()
                                }
                            } label: {
                                customiseToolBarButton
                            }
                            
                        }
                    }
                    
                }.navigationViewStyle(.stack)
                    .onAppear() {
                        let _ = timeManager.self.updateTimer
                    }
                
                
            }
            // Keep track of screenSize, in order to resize the Clocks correctly
            .onAppear(perform: {
                screenSize.width = geo.size.width
                screenSize.height = geo.size.height
                
                stopScreenSleeping()
            })
            .onChange(of: geo.size.width, perform: { width in
                screenSize.width = width
            })
            .onChange(of: geo.size.height, perform: { height in
                screenSize.height = height
            })
            
            
            
        }.environmentObject(themes)
            .environmentObject(timeManager)
        
    }
    
    var customiseToolBarButton: some View {
        ZStack {
            Circle()
                .foregroundColor(themes.currentBackground.primary)
                .frame(width: 50, height: 50)
            
            Image(systemName: "gearshape.fill")
                .foregroundColor(themes.currentBackground.secondary)
                .frame(width: 40, height: 40)
        }
        .padding(.top, 40)
    }
    
    func stopScreenSleeping() {
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
}




