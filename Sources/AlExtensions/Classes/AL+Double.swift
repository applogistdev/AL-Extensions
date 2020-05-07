//
//  AL+Double.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Double {
    
    /// Formats to Turkish currency
    /// - Parameter locale: Locale **(default: TR_tr)**
    /// - Returns: Formatted string
    func TLFormatted(locale: Locale = .init(identifier: "TR_tr")) -> String? {
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.locale = locale
        if let text = formatter.string(from: NSNumber.init(value: self)) {
            return "\(text) TL"
        }
        return nil
    }
    
    /// Formats to currency
    /// - Parameter locale: Locale **(default: TR_tr)**
    /// - Returns: Formatted string
    func currencyFormatted(locale: Locale = .init(identifier: "TR_tr")) -> String? {
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.locale = locale
        if let text = formatter.string(from: NSNumber.init(value: self)) {
            return "\(text)"
        }
        return nil
    }
    
    /// Round and return in String
    var rounded: String? {
        String(format: "%g", self)
    }
    
    /// Converts degree to radian
    func deg2rad() -> Double {
        return self * .pi / 180
    }
}
