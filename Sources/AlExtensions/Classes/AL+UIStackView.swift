//
//  UIStackView+Extensions.swift
//  
//
//  Created by Ahmet Sina on 18.10.2022.
//

import UIKit

extension UIStackView {
	
	@discardableResult
	/// Remove all arranged sub views from stack view
	/// - Returns: Removed views
	func removeAllArrangedSubviews() -> [UIView] {
		arrangedSubviews.reduce([UIView]()) { $0 + [removeArrangedSubViewProperly($1)] }
	}
  
	/// Remove arranged specific view from stack view
	/// - Parameter view: The related view to remove
	/// - Returns: Removed view
	func removeArrangedSubViewProperly(_ view: UIView) -> UIView {
		removeArrangedSubview(view)
		NSLayoutConstraint.deactivate(view.constraints)
		view.removeFromSuperview()
		return view
	}
}
