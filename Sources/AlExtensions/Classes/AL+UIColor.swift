//
//  AL+UIColor.swift
//  AlExtensions
//
//  Created by Soner Guler on 7.02.2019.
//

import UIKit
import SwiftUI

public extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    /// UIColor generetor with hex code
    /// - Parameter hex: The hex value with # or without it
    /// - Returns: UIColor for hex code
    static func hex(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /// Returns hex string of color
    var hexString: NSString {
        guard let colorRef =  self.cgColor.components else { return "#fff" }

        let red: CGFloat = colorRef[safe: 0] ?? 0
        let green: CGFloat = colorRef[safe: 1] ?? 0
        let blue: CGFloat = colorRef[safe: 2] ?? 0

        return NSString(format: "#%02lX%02lX%02lX", lroundf(Float(red * 255)), lroundf(Float(green * 255)), lroundf(Float(blue * 255)))
    }
    
    /// Modify UIColor value with params
    /// - Parameters:
    ///   - hue: Hue value
    ///   - additionalSaturation: Saturation value
    ///   - additionalBrightness: Brightness value
    /// - Returns: New UIColor
    func modified(withAdditionalHue hue: CGFloat = 0.0,
                  additionalSaturation: CGFloat = 0.0,
                  additionalBrightness: CGFloat) -> UIColor {
        
        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0
        
        if self.getHue(&currentHue,
                       saturation: &currentSaturation,
                       brightness: &currentBrigthness,
                       alpha: &currentAlpha) {
            let newColor = UIColor(hue: currentHue + hue,
                                   saturation: currentSaturation + additionalSaturation,
                                   brightness: currentBrigthness + additionalBrightness,
                                   alpha: currentAlpha)
            return newColor
        } else {
            return self
        }
    }
    
    /// Lighten a color.
    ///
    ///     let color = Color(red: r, green: g, blue: b, alpha: a)
    ///     let lighterColor: Color = color.lighten(by: 0.2)
    ///
    /// - Parameter percentage: Percentage by which to lighten the color.
    /// - Returns: A lightened color.
    func lighten(by percentage: CGFloat = 0.2) -> UIColor {
        // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: min(red + percentage, 1.0),
                     green: min(green + percentage, 1.0),
                     blue: min(blue + percentage, 1.0),
                     alpha: alpha)
    }

    ///  Darken a color.
    ///
    ///     let color = Color(red: r, green: g, blue: b, alpha: a)
    ///     let darkerColor: Color = color.darken(by: 0.2)
    ///
    /// - Parameter percentage: Percentage by which to darken the color.
    /// - Returns: A darkened color.
    func darken(by percentage: CGFloat = 0.2) -> UIColor {
        // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: max(red - percentage, 0),
                     green: max(green - percentage, 0),
                     blue: max(blue - percentage, 0),
                     alpha: alpha)
    }
    
    /// Set light and dark color as trait collection
	/// - Parameters:
	///   - lightModeColor: Color for light mode
	///   - darkModeColor: Color for dark mode
	convenience init(
		   light lightModeColor: @escaping @autoclosure () -> UIColor,
		   dark darkModeColor: @escaping @autoclosure () -> UIColor
		) {
		   self.init { traitCollection in
			   switch traitCollection.userInterfaceStyle {
			   case .light:
				   return lightModeColor()
			   case .dark:
				   return darkModeColor()
			   default:
				   return lightModeColor()
			   }
		   }
	   }
	
	/// Get dark version of color from asset
	var dark: UIColor  { resolvedColor(with: .init(userInterfaceStyle: .dark))  }
	
	/// Get light version of color from asset
	var light: UIColor { resolvedColor(with: .init(userInterfaceStyle: .light)) }
	
	/// Get as Color in SwiftUI
	var asColor : Color { Color(self) }
}
