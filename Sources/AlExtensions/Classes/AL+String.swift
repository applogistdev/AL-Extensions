//
//  AL+String.swift
//  AlExtensions
//
//  Created by Soner Guler on 9.10.2019.
//

import Foundation

public extension String {

    /// Trims the string from whitespaces
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Uppercased value in Turkish
    var uppercasedTurkish: String {
        return self.uppercased(with: Locale(identifier: "tr-TR"))
    }
    
    /// Url decoded string by adding **removingPercentEncoding**
    func urlDecoded() -> String? {
        return self.removingPercentEncoding
    }
    
    /// Email validation
    /// - Returns: Validation result
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Converts html content to NSAttributedString
    func html2AttributedString() -> NSAttributedString? {
        return self.data(using: .utf8)?.html2AttributedString()
    }
    
    /// Converts html content to String
    func html2String() -> String? {
        return self.html2AttributedString()?.string
    }
}
