//
//  AL+Localizable.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation


public protocol Localizable {
    
    /// Localized string
    var localized: String { get }
}

public protocol XIBLocalizable {
    
    /// Localized key
    var localeKey: String? { get set }
}


extension String: Localizable {
    
    public var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

extension UILabel: XIBLocalizable {
    
    @IBInspectable public var localeKey: String? {
        get { nil }
        set(key) {
            text = key?.localized
        }
    }
}

extension UIButton: XIBLocalizable {
    
    @IBInspectable public var localeKey: String? {
        get { nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
    
    @IBInspectable public var selectedLocaleKey: String? {
        get { nil }
        set(key) {
            setTitle(key?.localized, for: .selected)
        }
    }
}
