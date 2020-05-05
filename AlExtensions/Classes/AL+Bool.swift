//
//  AL+Bool.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Bool {
    
    /// Returns 1 == true || 2 == false
    func toInt() -> Int {
        return self ? 1 : 0
    }
    
    /// Returns "true" or "false
    func toStr() -> String {
        return self ? "true" : "false"
    }
}
