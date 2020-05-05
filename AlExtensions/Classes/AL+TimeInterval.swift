//
//  AL+TimeInterval.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension TimeInterval {
    
    /// Converts milisecond value to digit reprensentable string result
    /// - Returns: Digit value (etc. 02:30)
    func convertMilisecondToDigitResult() -> String {
        
        let time = NSInteger(self)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        if hours > 0 {
            return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
        } else {
            return String(format: "%0.2d:%0.2d", minutes, seconds)
        }
    }
}
