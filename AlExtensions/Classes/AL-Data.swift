//
//  AL-Data.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Data {
    
    /// Convert html text Data to nsattributesString
    func html2AttributedString() -> NSAttributedString? {
        return try? NSAttributedString(data: self,
                                       options: [.documentType: NSAttributedString.DocumentType.html,
                                                 .characterEncoding: String.Encoding.utf8.rawValue],
                                       documentAttributes: nil)
    }
    
    /// Converts html text data to String
    func html2String() -> String? {
        return self.html2AttributedString()?.string
    }
}
