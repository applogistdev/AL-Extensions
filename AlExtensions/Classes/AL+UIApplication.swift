import UIKit

public extension UIApplication {
    
    /// Get visible ViewController from the app's keyWindow
    var visibleViewController: UIViewController? {

        guard let rootViewController = keyWindow?.rootViewController else {
            return nil
        }
        return getVisibleViewController(rootViewController)
    }

    /// Getting visible ViewController that is presented by UIViewController, UINavigationController or UITabbarController
    ///
    /// - Returns: Presented View Controller
    func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {

        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }

        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }

        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }

        return rootViewController
    }
    
}
