//
//  SwiftUIView.swift
//  
//
//  Created by Fabian Poreda on 29.10.22.
//

import SwiftUI

struct SimpleClockView: View {
    
    @EnvironmentObject var clockThemes: ThemeManager
    @EnvironmentObject var timeManager: TimeManager
    
    @State var time: String = ""
    
    let fontWeight: Font.Weight
    
    var body: some View {
        
        GeometryReader { geo in
            let screenWidth = geo.size.width
            
            let screenHeight = geo.size.height
            
            
            var fontSize: CGFloat  {
                
                // Annahme: screenHeight und screenWidth sind bereits definierte Werte
                if screenHeight > screenWidth {
                    return screenHeight * 0.09
                }
                
                if screenHeight < screenWidth {
                    return screenWidth * 0.15
                }
                
                return 0
            }

            
            let textColor = clockThemes.currentBackground.singleColor
            
            Text(time)
                .font(.system(size: fontSize))
                .fontWeight(fontWeight)
                .monospacedDigit()
                .foregroundColor(textColor)
                .onChange(of: timeManager.date) { _ in
                    getCurrentTime()
                }
                .frame(width: screenWidth, height: screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 20)
            
            
        }
    }
    
    
    
    func getCurrentTime() {
        time = timeManager.timeString(timeFormat: "HH:mm:ss", date: timeManager.date)
    }
}

