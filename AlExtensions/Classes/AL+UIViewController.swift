import UIKit

public extension UIViewController {
    /// Embeds UIViewController in UINavigationController
    func embedInNC() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self)
        navVC.modalPresentationStyle = .fullScreen
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
}
