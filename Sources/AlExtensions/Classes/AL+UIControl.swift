//
//  AL+UIControl.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import UIKit

public class ClosureSleeve {
    let closure: () -> Void
    
    public init (_ closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

public extension UIControl {
    
    /// Add Action with closure style
    /// - Parameters:
    ///   - controlEvents: Countrol Event
    ///   - closure: Handler closure
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping () -> Void) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    
    /// Add Tap Action (.touchUpInside)
    /// - Parameter closure: Tap handler closure
    func addTapAction(_ closure: @escaping () -> Void) {
        addAction(for: .touchUpInside, closure)
    }
}
