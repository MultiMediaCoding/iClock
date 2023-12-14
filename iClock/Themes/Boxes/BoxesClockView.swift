//
//  SwiftUIView.swift
//  
//
//  Created by Fabian Poreda on 31.10.22.
//

import SwiftUI

struct BoxesClockView: View {
    
    @EnvironmentObject var timeManager: TimeManager
    
    var body: some View {
        
        GeometryReader { geo in 
            
            let screenWidth = geo.size.width
            let screenHeight =  geo.size.height
            
            var isPhoneMode: Bool {
                // Screen Height is larger then screen width
                if screenWidth < screenHeight {
                    return true
                }
                // In Desktop Mode
                else  {
                    return false
                }}
            
            var spaceBetweenBoxes: CGFloat {
                return screenWidth * 0.05
            }
            
            VStack {
                Spacer()
                HStack  (spacing: spaceBetweenBoxes) {
                    SingleBoxElement(type: timeType.hour,  geo: geo)
                    
                    SingleBoxElement(type: timeType.minute,  geo: geo)
                    
                    SingleBoxElement(type: timeType.second, geo: geo)
                    
                }.frame(width: geo.size.width)
                Spacer()
            }
            
                
            
        }
        }
    }
    
struct SingleBoxElement: View {
    
    let type: timeType
    var geo: GeometryProxy
    
    
    @EnvironmentObject var timeManager: TimeManager
    
    @EnvironmentObject var clockThemes: ThemeManager
    
    @State var numberValue: String = ""
    
    
    var body: some View {
        
        let screenWidth = geo.size.width
        
        var fontSize: CGFloat {
            return screenWidth * 0.1
        }
        
        var boxWidth : CGFloat {
            return  screenWidth * 0.25
        }
        
        var boxHeight : CGFloat {
            return screenWidth * 0.15
        }
        
        var boxCornerRadius: CGFloat {
            return screenWidth * 0.02
        }
        
        
        ZStack{
            Text(numberValue)
                .font(.custom("Avenir Next", size: fontSize))
                .foregroundColor(clockThemes.currentBackground.secondary)
                .monospacedDigit()
                .transition(AnyTransition.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                .id("Seconds" + numberValue)
                .frame(width: boxWidth, height: boxHeight, alignment: .center)
        }
        
        
        .background(clockThemes.currentBackground.primary)
        .cornerRadius(boxCornerRadius)
        .clipped()
        .onAppear() {
            update()
        }
        .onChange(of: timeManager.date) { _ in
            update()
        }}
    
    private func getNumber() -> String {
        
        if type == .hour {
            return timeManager.hours
        }
        
        if type == .minute {
            return timeManager.minutes
        }
        
        if type == .second {
            return timeManager.seconds
        }
        
        return ""
    }
    
    private func update() {
        withAnimation (.easeInOut(duration: 0.5)) {
            numberValue = getNumber()
        }
    }
    
    
}
