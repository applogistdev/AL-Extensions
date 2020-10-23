//
//  AL+Double.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Int {
    
    /// Returns seconds value to digit reprensentable string result
    /// - Returns: Digit value (etc. 02:30)
    var secondToDigitResult : String {
        let minute = (self % 3600) / 60
        let second = (self % 3600) % 60
        return String(format: "%0.2d:%0.2d", minute, second)
    }
    
    var milisecondToDigitResult : String {
        Double(self).convertMilisecondToDigitResult
    }
}
