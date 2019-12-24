//
//  AL+UIView.swift
//  AlExtensions
//
//  Created by Soner Guler on 9.10.2019.
//

import UIKit

public extension UIView {
    
    /// Fades in the view
    func fadeIn(duration: TimeInterval = 0.1) {
        if !self.isHidden {
            return
        }
        DispatchQueue.main.async {
            self.alpha = 0.0
            self.isHidden = false
            UIView.animate(withDuration: duration) {
                self.alpha = 1.0
            }
        }
    }
    
    /// Fades out the view
    func fadeOut(duration: TimeInterval = 0.1) {
        if self.isHidden {
            return
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration, delay: 0, options: [.layoutSubviews], animations: {
                self.alpha = 0.0
            }, completion: { (done) in
                self.isHidden = done
            })
        }
    }
}
