import UIKit

extension UIViewController {
    /// Embeds UIViewController in UINavigationController
    func embedInNC() -> UINavigationController {
        return UINavigationController(rootViewController: self)
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
    
    /// Changes Status bar with given style in parameter 
    ///
    /// - Parameter style: Desired status bar style
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
    
    /// Returns class name
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
}
