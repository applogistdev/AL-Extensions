//
//  UINavigationBar.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import UIKit.UINavigationBar

extension UINavigationBar {
    
    /// Make navigation bar transparent
    /// - Parameter tintColor: New tint color of navigation bar **Default:nil**
    func makeTransparent(tintColor: UIColor? = nil)  {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.barTintColor = .clear
        self.tintColor = tintColor
        if #available(iOS 13.0, *) {
            self.compactAppearance?.backgroundColor = .clear
            self.compactAppearance?.backgroundEffect = nil
            self.standardAppearance.backgroundColor = .clear
            self.standardAppearance.backgroundEffect = nil
            self.scrollEdgeAppearance?.backgroundColor = .clear
            self.scrollEdgeAppearance?.backgroundEffect = nil
        }
    }
    
    /// Adds grandiented backgroundColor
    /// - Parameters:
    ///   - startColor: Starting Color
    ///   - endColor: Ending Color
    func addGradientBackground(startColor: UIColor, endColor: UIColor) {
        let bgImage = UIImage.gradiented(startColor: startColor,
                                         endColor: endColor,
                                         size: CGSize( width: UIScreen.main.bounds.width , height: 1))
        self.barTintColor = UIColor(patternImage: bgImage!)
    }
}
