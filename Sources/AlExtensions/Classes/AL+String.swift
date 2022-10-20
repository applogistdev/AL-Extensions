//
//  AL+String.swift
//  AlExtensions
//
//  Created by Soner Guler on 9.10.2019.
//

import Foundation

public extension String {

    /// Returns trimmed string from trimming characters in whitespaces
    var trimmed : String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Uppercased value in Turkish
    var uppercasedTurkish: String {
        self.uppercased(with: Locale(identifier: "tr-TR"))
    }
    
    /// Url decoded string by adding **removingPercentEncoding**
    var urlDecoded : String? {
        self.removingPercentEncoding
    }
    
    /// Email validation
    /// - Returns: Validation result
    var isValidEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// Returns NSAttributedString from html content
    var html2AttributedString: NSAttributedString? {
        self.data(using: .utf8)?.html2AttributedString()
    }
    
    /// Return String from HTML content
    var html2String : String? {
        self.html2AttributedString?.string
    }
}
