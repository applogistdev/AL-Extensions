//
//  AL+Bool.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Bool {
    
    /// Returns 1 == true || 2 == false
    var toInt: Int {
        self ? 1 : 0
    }
    
    /// Returns "true" or "false
    var toStr : String {
        String(self)
    }
}
