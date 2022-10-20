//
//  AL+Bundle.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Bundle {
    
    /// App Version Number
    public var versionNumber: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    // App build Number
    public var buildNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
    
    /// App bundle name
    public var bundleName: String {
        return (infoDictionary?["CFBundleName"] as? String) ?? ""
    }
}
