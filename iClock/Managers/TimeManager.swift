//
//  TimeManager.swift
//  iClock
//
//  Created by Fabian Poreda on 20.10.22.
//

import SwiftUI

enum timeType {
    case hour, minute, second
}

class TimeManager: ObservableObject {
    @Published var date = Date()
    
    @Published var hours: String = ""
    @Published var minutes: String = ""
    @Published var seconds: String = ""
    
    // update time
    var updateTimer: Timer {
        withAnimation(.spring()){
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                                 block: { [self]_ in
                
                self.date = Date()
                
                self.hours = self.timeString(timeFormat: "HH", date: date)
                self.minutes = self.timeString(timeFormat: "mm", date: date)
                self.seconds = self.timeString(timeFormat: "ss", date: date)
                
            })
        }
    }
    
    // generate a time string for a special format
    func timeString(timeFormat: String, date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat
        
        let time = formatter.string(from: date)
        
        return time
    }
}

extension DateFormatter {
    
    static var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmmss"
        return formatter
    }
}
