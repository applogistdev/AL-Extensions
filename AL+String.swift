//
//  AL+String.swift
//  AlExtensions
//
//  Created by Soner Guler on 9.10.2019.
//

import Foundation

extension String {

    /// Trims the string from whitespaces
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
