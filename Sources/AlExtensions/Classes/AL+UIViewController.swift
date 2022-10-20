import UIKit

public extension UIViewController {
    
    /// Embeds UIViewController in UINavigationController
    func embedInNC(isFullScreen: Bool = true) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self)
        if isFullScreen {
            navVC.modalPresentationStyle = .fullScreen
        }
        return navVC
    }
    
    /// Dismiss keyboard when editing end.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Returns Nib object of given Nib name
    ///
    /// - Parameter name: Nib name
    /// - Returns: Nib object
    func nib(name: String) -> UINib {
        return UINib(nibName: name, bundle: .main)
    }
    
    
    /// Returns class name
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
    /// Current top most shown view controller
    var topMostViewController : UIViewController {
		if let presented = presentedViewController {
			return presented.topMostViewController
		}
		
		if let navigation = self as? UINavigationController {
			return navigation.visibleViewController?.topMostViewController ?? navigation
		}
		
		if let tab = self as? UITabBarController {
			return tab.selectedViewController?.topMostViewController ?? tab
		}
		return self
	}
}
