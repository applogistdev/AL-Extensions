//
//  AL+Bundle.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import Foundation

extension Bundle {
    
    /// App Version Number
    var versionNumber: String {
        return (infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    }
    
    // App build Number
    var buildNumber: String {
        return (infoDictionary?["CFBundleVersion"] as? String) ?? ""
    }
    
    /// App bundle name
    var bundleName: String {
        return (infoDictionary?["CFBundleName"] as? String) ?? ""
    }
}
