//
//  LayoutOptionsView.swift
//  iClock
//
//  Created by Fabian Poreda on 22.10.22.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSheet: Bool
    
    @EnvironmentObject var themes: ThemeManager
    
    @EnvironmentObject var timeManager: TimeManager
    
    @State private var selectedMenu: SettingsMenuSelection = .backgroundSelection

    var body: some View {
        
        
        NavigationStack {
            Form {

                Picker("", selection: $selectedMenu) {
                    Text("Hintergrund").tag(SettingsMenuSelection.backgroundSelection)
                    Text("Uhr").tag(SettingsMenuSelection.clockSelection)
                    Text("Infos").tag(SettingsMenuSelection.infoSelection)
                }.pickerStyle(.segmented)
                
                if selectedMenu == .backgroundSelection {
                    BackgroundSelectionView()
                }
                else if selectedMenu == .clockSelection {
                    ClockSelectionView()
                }
                else if selectedMenu == .infoSelection {
                    InformationView()
                }
                
            }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Fertig") {
                            showSheet.toggle()
                        }
                        .fontWeight(.bold)
                    }
                }
                .navigationTitle("Einstellungen")
        }
        
    }
        
    }

enum SettingsMenuSelection { case backgroundSelection, clockSelection, infoSelection }
