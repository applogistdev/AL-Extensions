//
//  Anchor.swift
//  AlExtensions
//
//  Created by Soner Güler on 5.05.2020.
//

import UIKit

//swiftlint:disable all
public extension UIView {
    func anchor() -> Anchor { return Anchor(view: self) }
    
    var top: NSLayoutAnchor<NSLayoutYAxisAnchor> { return topAnchor }
    var left: NSLayoutAnchor<NSLayoutXAxisAnchor> { return leftAnchor }
    var bottom: NSLayoutAnchor<NSLayoutYAxisAnchor> { return bottomAnchor }
    var right: NSLayoutAnchor<NSLayoutXAxisAnchor> { return rightAnchor }
    var height: NSLayoutDimension { return heightAnchor }
    var width: NSLayoutDimension { return widthAnchor }
    var centerX: NSLayoutXAxisAnchor { return centerXAnchor }
    var centerY: NSLayoutYAxisAnchor { return centerYAnchor }
}
// swiftlint:disable identifier_name
public struct Anchor {
    public let view: UIView
    public let top: NSLayoutConstraint?
    public let left: NSLayoutConstraint?
    public let bottom: NSLayoutConstraint?
    public let right: NSLayoutConstraint?
    public let height: NSLayoutConstraint?
    public let width: NSLayoutConstraint?
    public let centerX: NSLayoutConstraint?
    public let centerY: NSLayoutConstraint?
    
    public init(view: UIView) {
        self.view = view
        top = nil
        left = nil
        bottom = nil
        right = nil
        height = nil
        width = nil
        centerX = nil
        centerY = nil
    }
    
    private init(view: UIView,
                 top: NSLayoutConstraint?,
                 left: NSLayoutConstraint?,
                 bottom: NSLayoutConstraint?,
                 right: NSLayoutConstraint?,
                 height: NSLayoutConstraint?,
                 width: NSLayoutConstraint?,
                 centerX: NSLayoutConstraint?,
                 centerY: NSLayoutConstraint?) {
        self.view = view
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
        self.height = height
        self.width = width
        self.centerX = centerX
        self.centerY = centerY
    }
    
    private func update(edge: NSLayoutConstraint.Attribute, constraint: NSLayoutConstraint?) -> Anchor {
        var top = self.top
        var left = self.left
        var bottom = self.bottom
        var right = self.right
        var height = self.height
        var width = self.width
        var centerX = self.centerX
        var centerY = self.centerY
        
        switch edge {
            case .top: top = constraint
            case .left: left = constraint
            case .bottom: bottom = constraint
            case .right: right = constraint
            case .height: height = constraint
            case .width: width = constraint
            case .centerX: centerX = constraint
            case .centerY: centerY = constraint
            default: return self
        }
        
        return Anchor(
            view: self.view,
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            height: height,
            width: width,
            centerX: centerX,
            centerY: centerY)
    }
    
    private func insert(anchor: Anchor) -> Anchor {
        return Anchor(
            view: self.view,
            top: anchor.top ?? top,
            left: anchor.left ?? left,
            bottom: anchor.bottom ?? bottom,
            right: anchor.right ?? right,
            height: anchor.height ?? height,
            width: anchor.width ?? width,
            centerX: anchor.centerX ?? centerX,
            centerY: anchor.centerY ?? centerY)
    }
    
    // MARK: Anchor to superview edges
    public func topToSuperview(constant c: CGFloat = 0) -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return top(to: superview.top, constant: c)
    }
    
    public func leftToSuperview(constant c: CGFloat = 0) -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return left(to: superview.left, constant: c)
    }
    
    public func bottomToSuperview(constant c: CGFloat = 0) -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return bottom(to: superview.bottom, constant: c)
    }
    
    public func rightToSuperview(constant c: CGFloat = 0) -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return right(to: superview.right, constant: c)
    }
    
    public func edgesToSuperview(omitEdge e: NSLayoutConstraint.Attribute = .notAnAttribute,
                                 insets: UIEdgeInsets = UIEdgeInsets.zero) -> Anchor {
        let superviewAnchors = topToSuperview(constant: insets.top)
            .leftToSuperview(constant: insets.left)
            .bottomToSuperview(constant: insets.bottom)
            .rightToSuperview(constant: insets.right)
            .update(edge: e, constraint: nil)
        return self.insert(anchor: superviewAnchors)
    }
    
    // MARK: Anchor to superview axises
    public func centerXToSuperview() -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return centerX(to: superview.centerX)
    }
    
    public func centerYToSuperview() -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return centerY(to: superview.centerY)
    }
    
    public func centerToSuperview() -> Anchor {
        guard let superview = view.superview else {
            return self
        }
        return centerX(to: superview.centerX)
            .centerY(to: superview.centerY)
    }
    
    // MARK: Anchor to
    public func top(to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .top, constraint: view.top.constraint(equalTo: anchor, constant: c))
    }
    
    public func left(to anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .left, constraint: view.left.constraint(equalTo: anchor, constant: c))
    }
    
    public func bottom(to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .bottom, constraint: view.bottom.constraint(equalTo: anchor, constant: c))
    }
    
    public func right(to anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .right, constraint: view.right.constraint(equalTo: anchor, constant: c))
    }
    
    // MARK: Anchor greaterOrEqual
    public func top(greaterOrEqual anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .top, constraint: view.top.constraint(greaterThanOrEqualTo: anchor, constant: c))
    }
    
    public func left(greaterOrEqual anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .left, constraint: view.left.constraint(greaterThanOrEqualTo: anchor, constant: c))
    }
    
    public func bottom(greaterOrEqual anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .bottom, constraint: view.bottom.constraint(greaterThanOrEqualTo: anchor, constant: c))
    }
    
    public func right(greaterOrEqual anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .right, constraint: view.right.constraint(greaterThanOrEqualTo: anchor, constant: c))
    }
    
    // MARK: Anchor lessOrEqual
    public func top(lesserOrEqual anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .top, constraint: view.top.constraint(lessThanOrEqualTo: anchor, constant: c))
    }
    
    public func left(lesserOrEqual anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .left, constraint: view.left.constraint(lessThanOrEqualTo: anchor, constant: c))
    }
    
    public func bottom(lesserOrEqual anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .bottom, constraint: view.bottom.constraint(lessThanOrEqualTo: anchor, constant: c))
    }
    
    public func right(lesserOrEqual anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .right, constraint: view.right.constraint(lessThanOrEqualTo: anchor, constant: c))
    }
    
    // MARK: Dimension anchors
    public func height(constant c: CGFloat) -> Anchor {
        return update(edge: .height, constraint: view.height.constraint(equalToConstant: c))
    }
    
    public func height(to dimension: NSLayoutDimension, multiplier m: CGFloat = 1) -> Anchor {
        return update(edge: .height, constraint: view.height.constraint(equalTo: dimension, multiplier: m))
    }
    
    public func width(constant c: CGFloat) -> Anchor {
        return update(edge: .width, constraint: view.width.constraint(equalToConstant: c))
    }
    
    public func width(to dimension: NSLayoutDimension, multiplier m: CGFloat = 1) -> Anchor {
        return update(edge: .width, constraint: view.width.constraint(equalTo: dimension, multiplier: m))
    }
    
    // MARK: Axis anchors
    public func centerX(to axis: NSLayoutXAxisAnchor, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .centerX, constraint: view.centerX.constraint(equalTo: axis, constant: c))
    }
    
    public func centerY(to axis: NSLayoutYAxisAnchor, constant c: CGFloat = 0) -> Anchor {
        return update(edge: .centerY, constraint: view.centerY.constraint(equalTo: axis, constant: c))
    }
    
    // MARK: Activation
    public func activate() -> Anchor {
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [top, left, bottom, right, height, width, centerX, centerY].compactMap({ $0 })
        NSLayoutConstraint.activate(constraints)
        return self
    }
    
    // MARK: Activation Void
    public func activated() {
        _ = activate()
    }
}

