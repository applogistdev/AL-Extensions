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
        
        /*
         int seconds = (int) (milliseconds / 1000) % 60 ;
         int minutes = (int) ((milliseconds / (1000*60)) % 60);
         int hours   = (int) ((milliseconds / (1000*60*60)) % 24);
         */
        
        let seconds = Int((self / 1000.0).truncatingRemainder(dividingBy: 60))
        let minutes = Int((self / (1000.0 * 60.0)).truncatingRemainder(dividingBy: 60))
        let hours = Int((self / (1000.0 * 60.0 * 60.0)).truncatingRemainder(dividingBy: 24))
        if hours > 0 {
            return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
        } else {
            return String(format: "%0.2d:%0.2d", minutes, seconds)
        }
    }
}
